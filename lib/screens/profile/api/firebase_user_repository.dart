import 'package:firebase_auth/firebase_auth.dart';
import 'package:geo_tracker/screens/profile/domain/user_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: UserRepository)
class FirebaseTodoRepository implements UserRepository {
  FirebaseTodoRepository();

  @override
  Future<String> getUserEmail() async {
    final email = FirebaseAuth.instance.currentUser!.email;
    return email ?? '';
  }

  @override
  Future<String> getUserName() async {
    final name = FirebaseAuth.instance.currentUser!.displayName;
    return name ?? '';
  }

  @override
  Future<String> getUserPhoto() async {
    final photo = FirebaseAuth.instance.currentUser!.photoURL;
    return photo ?? '';
  }
}
