import 'package:shared_preferences/shared_preferences.dart';
import 'package:news_reader_app/core/constants/app_constants.dart';

class AuthDataSource {
  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));

    if (email == AppConstants.mockEmail && password == AppConstants.mockPassword) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppConstants.isLoggedInKey, true);
    } else {
      throw Exception('Invalid email or password.');
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.isLoggedInKey);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppConstants.isLoggedInKey) ?? false;
  }
}
