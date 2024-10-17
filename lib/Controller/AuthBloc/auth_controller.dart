import 'package:geeksynergy_mechine_task/Model/user_model.dart';
import 'package:hive/hive.dart';
class UserController {
  Box<Map<String, dynamic>>? _userBox;

  Future<Box<Map<String, dynamic>>> _getUserBox() async {
    if (_userBox == null || !Hive.isBoxOpen('userBox')) {
      _userBox = await Hive.openBox<Map<String, dynamic>>('userBox');
    }
    return _userBox!;
  }

  Future<void> saveUser(UserModel user) async {
    var box = await _getUserBox();
    // Save user as a map using toJson
    await box.put(user.email, user.toJson()); // Save user with email as the key
  }

  UserModel? getUserByEmail(String email) {
    if (Hive.isBoxOpen('userBox')) {
      final userMap = Hive.box<Map<String, dynamic>>('userBox').get(email);
      return userMap != null ? UserModel.fromJson(userMap) : null; // Convert map to UserModel
    }
    return null; // Return null if the box isn't open
  }

  UserModel? getUserByUsername(String username) {
    if (Hive.isBoxOpen('userBox')) {
      // Retrieve all users and check for the one with the matching username
      for (var userMap in Hive.box<Map<String, dynamic>>('userBox').values) {
        UserModel user = UserModel.fromJson(userMap);
        if (user.name == username) {
          return user; // Return the UserModel if the name matches
        }
      }
    }
    return null; // Return null if the box isn't open or no user is found
  }
   UserModel? getUser() {
    if (Hive.isBoxOpen('userBox')) {
      return Hive.box<UserModel>('userBox').get('user');
    }
    return null;
  }

}

 
