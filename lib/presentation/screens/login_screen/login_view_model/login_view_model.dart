import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider =
StateNotifierProvider<LoginViewModel, bool>((ref) => LoginViewModel());

class LoginViewModel extends StateNotifier<bool> {
  LoginViewModel() : super(false);

  bool login(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      state = true;
      return true;
    }
    return false;
  }

  void logout() {
    state = false;
  }
}