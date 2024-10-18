import 'package:geeksynergy_mechine_task/Model/user_model.dart';
import 'package:hive/hive.dart';

class UserController {
  Box<UserModel>? _userBox;

  Future<Box<UserModel>> _getUserBox() async {
    if (_userBox == null || !Hive.isBoxOpen('userBox')) {
      _userBox = await Hive.openBox<UserModel>('userBox');
    }
    return _userBox!;
  }

  Future<void> saveUser(UserModel user) async {
    var box = await _getUserBox();
    await box.put(user.name, user);
  }

  UserModel? getUser(String username) {
    if (Hive.isBoxOpen('userBox')) {
      return Hive.box<UserModel>('userBox').get(username);
    }
    return null;
  }

  List<UserModel> getAllUsers() {
    if (Hive.isBoxOpen('userBox')) {
      return Hive.box<UserModel>('userBox').values.toList();
    }
    return [];
  }

  Future<void> deleteUser(String username) async {
    var box = await _getUserBox();
    await box.delete(username);
  }
}
