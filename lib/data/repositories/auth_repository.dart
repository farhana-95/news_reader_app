import 'package:news_reader_app/data/sources/auth_data_source.dart';

class AuthRepository {
  final AuthDataSource _source;
  AuthRepository(this._source);

  Future<void> login(String email, String password) => _source.login(email, password);
  Future<void> logout() => _source.logout();
  Future<bool> isLoggedIn() => _source.isLoggedIn();
}
