import 'package:hive/hive.dart';

part 'user_model.g.dart';
@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String password;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final String profession;

  UserModel({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
    required this.profession,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'password': password,
        'email': email,
        'phone': phone,
        'profession': profession,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      password: json['password'],
      email: json['email'],
      phone: json['phone'],
      profession: json['profession'],
    );
  }
}
