part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final String message;

  LoginSuccess({required this.message});
}

final class LoginFailed extends AuthState {
  final String message;

  LoginFailed({required this.message});
}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpFailed extends AuthState {
  final String message;

  SignUpFailed({required this.message});
}
