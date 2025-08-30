import 'package:hive/hive.dart';
import '../models/user_model.dart';

class AuthService {
  static const String userBoxName = 'userBox';

  Future<void> addUser(UserModel user) async {
    final box = await Hive.openBox<UserModel>(userBoxName);
    await box.put(user.username, user);
  }

  Future<UserModel?> getUser(String username) async {
    final box = await Hive.openBox<UserModel>(userBoxName);
    return box.get(username);
  }

  Future<bool> userExists(String username) async {
    final box = await Hive.openBox<UserModel>(userBoxName);
    return box.containsKey(username);
  }

  Future<List<UserModel>> getAllUsers() async {
    final box = await Hive.openBox<UserModel>(userBoxName);
    return box.values.toList();
  }
}
