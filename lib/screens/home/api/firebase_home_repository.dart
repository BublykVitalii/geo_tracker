import 'package:firebase_auth/firebase_auth.dart';
import 'package:geo_tracker/screens/home/domain/home_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: HomeRepository)
class FirebaseTodoRepository implements HomeRepository {
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
