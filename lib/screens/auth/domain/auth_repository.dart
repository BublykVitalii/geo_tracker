abstract class AuthRepository {
  Future<void> logOut();
  Future<void> signInWithGoogle();
  Future<bool> inLoggedIn();
}
