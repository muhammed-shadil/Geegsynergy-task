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
      UserModel? user = userController.getUser(event.name);
      if (user != null && user.password == event.password) {
        emit(LoginSuccess(message: "Successfully logged in"));
      } else {
        emit(LoginFailed(message: "Invalid credentials"));
      }
    } catch (e) {
      emit(LoginFailed(message: "Failed to login"));
    }
  }

  FutureOr<void> signup(SignUpEvent event, Emitter<AuthState> emit) async {
    final UserController userController = UserController();
    try {
      emit(SignUpLoading());

      UserModel? existingUser = userController.getUser(event.userModel.name);
      if (existingUser != null) {
        emit(SignUpFailed(message: "User already exists"));
        return;
      }
      await userController.saveUser(event.userModel);

      emit(SignUpSuccess(message: "Successfully signed up"));
    } catch (e) {
      emit(SignUpFailed(message: "Failed to sign up"));
    }
  }
}
