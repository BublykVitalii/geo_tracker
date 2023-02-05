import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:geo_tracker/screens/profile/domain/user_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  UserService get userService => GetIt.instance.get<UserService>();

  void getUserInfo() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      String email = await userService.getUserEmail();
      String name = await userService.getUserName();
      String photo = await userService.getUserPhoto();
      emit(state.copyWith(
        status: HomeStatus.success,
        email: email,
        name: name,
        photo: photo,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: error.toString(),
      ));
    }
  }
}
