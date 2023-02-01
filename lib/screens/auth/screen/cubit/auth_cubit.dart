import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_tracker/screens/auth/domain/auth_service.dart';
import 'package:get_it/get_it.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());
  AuthService get authService => GetIt.instance.get<AuthService>();

  void signInWithGoogle() async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      await authService.signInWithGoogle();
      emit(state.copyWith(status: AuthStatus.success));
    } catch (error) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: error.toString(),
      ));
    }
  }
}
