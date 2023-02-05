import 'package:geo_tracker/screens/profile/domain/user_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserService {
  UserService(this._userRepository);
  final UserRepository _userRepository;

  Future<String> getUserEmail() async {
    String email = await _userRepository.getUserEmail();
    return email;
  }

  Future<String> getUserName() async {
    String name = await _userRepository.getUserName();
    return name;
  }

  Future<String> getUserPhoto() async {
    String photo = await _userRepository.getUserPhoto();
    return photo;
  }
}
