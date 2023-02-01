import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _token = 'token';

@singleton
class StoreInteraction {
  Future<String?> getToken() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getString(_token);
  }

  Future<void> setToken(String token) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString(_token, token);
  }

  Future<bool> removeUserToken() async {
    final preference = await SharedPreferences.getInstance();
    return await preference.clear();
  }
}
