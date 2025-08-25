import 'dart:async';
import '../models/user_model.dart';

class AuthService {
  final List<UserModel> _users = [];

  // Simulate login API
  Future<UserModel> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final user = _users.firstWhere(
        (u) => u.username == username && u.token == password,
        orElse: () => throw Exception("Invalid username or password"),
      );
      return user;
    } catch (e) {
      throw Exception("Invalid username or password");
    }
  }

  // Simulate signup API
  Future<UserModel> signup(
    String email,
    String username,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    final exists = _users.any(
      (u) => u.username == username || u.email == email,
    );
    if (exists) {
      throw Exception("User already exists");
    }

    final newUser = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      username: username,
      email: email,
      token: password, // test
    );

    _users.add(newUser);
    return newUser;
  }
}
