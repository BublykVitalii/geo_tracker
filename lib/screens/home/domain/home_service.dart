import 'package:geo_tracker/screens/home/domain/home_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserService {
  UserService(this._homeRepository);
  final HomeRepository _homeRepository;

  Future<String> getUserEmail() async {
    String email = await _homeRepository.getUserEmail();
    return email;
  }

  Future<String> getUserName() async {
    String name = await _homeRepository.getUserName();
    return name;
  }

  Future<String> getUserPhoto() async {
    String photo = await _homeRepository.getUserPhoto();
    return photo;
  }
}
