import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geeksynergy_mechine_task/Controller/AuthBloc/auth_controller.dart';
import 'package:geeksynergy_mechine_task/Model/user_model.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(login);
    on<SignUpEvent>(signup);
  }

  FutureOr<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    final UserController userController = UserController();
    try {
      emit(LoginLoading());
      UserModel? user =
          userController.getUser(); // No need to open the box here
      if (user != null &&
          user.name == event.name &&
          user.password == event.password) {
        emit(LoginSuccess(message: "Successfully login"));
      } else {
        emit(LoginFailed(message: "Invalid credentials"));
      }
    } catch (e) {
      print(e.toString());
      emit(LoginFailed(message: "Failed to login"));
    }
  }

  FutureOr<void> signup(SignUpEvent event, Emitter<AuthState> emit) async {
    try {
      emit(SignUpLoading());

      final UserController userController = UserController();

      // Check if the user already exists (by email, username, or phone)
      UserModel? existingUser =
          userController.getUserByEmail(event.userModel.email);
      if (existingUser != null) {
        emit(SignUpFailed(message: "Email already in use"));
        return;
      }

      // You can add other checks for username, phone, etc.
      UserModel? existingUsername =
          userController.getUserByUsername(event.userModel.name);
      if (existingUsername != null) {
        emit(SignUpFailed(message: "Username already taken"));
        return;
      }

      // If no user exists with the same credentials, save the new user
      await userController.saveUser(event.userModel);

      emit(SignUpSuccess(message: "Successfully signed up"));
    } catch (e) {
      emit(SignUpFailed(message: "Failed to sign up"));
    }
  }
}
