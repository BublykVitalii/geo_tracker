import 'package:injectable/injectable.dart';

import 'package:geo_tracker/screens/auth/domain/auth_repository.dart';

@singleton
class AuthService {
  AuthService(this._authRepository);
  final AuthRepository _authRepository;

  Future<void> signInWithGoogle() async {
    _authRepository.signInWithGoogle();
  }

  Future<bool> inLoggedIn() async {
    return await _authRepository.inLoggedIn();
  }

  Future<void> logOut() async {
    _authRepository.logOut();
  }
}
