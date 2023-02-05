import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geo_tracker/utils/store_interaction.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:geo_tracker/screens/auth/domain/auth_repository.dart';

@Singleton(as: AuthRepository)
class HttpAuthRepository implements AuthRepository {
  HttpAuthRepository(this._preference);

  final authTodo = FirebaseAuth.instance;
  final StoreInteraction _preference;
  final todoCollection = FirebaseFirestore.instance;

  @override
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final idToken = googleUser?.id;
      await _preference.setToken(idToken ?? '');
      todoCollection.collection(idToken ?? '');
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        throw AssertionError('The password provided is too weak.');
      } else if (error.code == 'email-already-in-use') {
        throw AssertionError('The account already exists for that email.');
      }
    }
  }

  @override
  Future<bool> inLoggedIn() async {
    final sessionId = await _preference.getToken();
    return sessionId.isNotEmpty;
  }

  @override
  Future<void> logOut() async {
    await _preference.removeUserToken();
  }
}
