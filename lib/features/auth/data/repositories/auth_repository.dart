import '../data_sources/auth_service.dart';
import '../models/user_model.dart';

class AuthRepository {
  final AuthService service;
  AuthRepository(this.service);

  Future<UserModel> login(String username, String password) {
    return service.login(username, password);
  }

  Future<UserModel> signup(String email, String username, String password) {
    return service.signup(email, username, password);
  }
}
