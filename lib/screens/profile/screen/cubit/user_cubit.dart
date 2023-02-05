import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:geo_tracker/screens/profile/domain/user_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());
  UserService get userService => GetIt.instance.get<UserService>();

  void getUserInfo() async {
    try {
      emit(state.copyWith(status: UserStatus.loading));
      String email = await userService.getUserEmail();
      String name = await userService.getUserName();
      String photo = await userService.getUserPhoto();
      emit(state.copyWith(
        status: UserStatus.success,
        email: email,
        name: name,
        photo: photo,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: UserStatus.error,
        errorMessage: error.toString(),
      ));
    }
  }
}
