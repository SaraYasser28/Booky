import '../data_sources/auth_service.dart';
import '../models/user_model.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<UserModel> signup(
    String email,
    String username,
    String password,
  ) async {
    if (await _authService.userExists(username)) {
      throw Exception("User already exists");
    }

    final user = UserModel(
      email: email,
      username: username,
      password: password,
    );
    await _authService.addUser(user);
    return user;
  }

  Future<UserModel> login(String username, String password) async {
    final user = await _authService.getUser(username);
    if (user == null) {
      throw Exception("User not found");
    }
    if (user.password != password) {
      throw Exception("Incorrect password");
    }
    return user;
  }
}
