part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String name;
  final String password;

  LoginEvent({required this.name, required this.password});
}

class SignUpEvent extends AuthEvent {
  final UserModel userModel;

  SignUpEvent({required this.userModel});
}
