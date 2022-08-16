import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:foodies/features/profile/domain/usecases/sign_out_usecase.dart';

import '../../../signup/domain/usecases/create_current_user_usecase.dart';
import '../../../signup/domain/usecases/login_usecase.dart';
import '../../../signup/domain/usecases/signup_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignupUseCase signupUseCase;
  final LoginUseCase loginUseCase;
  final CreateCurrentUserUsecase createCurrentUserUsecase;
  final SignOutUseCase signOutUseCase;

  LoginCubit({
    required this.signupUseCase,
    required this.loginUseCase,
    required this.createCurrentUserUsecase,
    required this.signOutUseCase,
  }) : super(LoginInitial());

  Future<void> submitLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      await loginUseCase.call(email, password);
      emit(LoginSuccess());
    } on SocketException catch (e) {
      emit(LoginFailure(e.message));
    } catch (_) {
      emit(LoginFailure("Firebase Exception"));
    }
  }

  Future<void> submitRegisteration({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userClass,
    required String hall,
    required String floor,
    required String wing,
    required String roomNo,
  }) async {
    emit(LoginLoading());
    try {
      await signupUseCase.call(email, password);
      await createCurrentUserUsecase.call(
          email, firstName, lastName, userClass, hall, floor, wing, roomNo);
      emit(LoginSuccess());
    } on SocketException catch (e) {
      emit(LoginFailure(e.message));
    } catch (_) {
      emit(LoginFailure("Firebase Exception"));
    }
  }

  Future<void> submitSignOut() async {
    try {
      await signOutUseCase.call();
    } on SocketException catch (e) {}
  }
}
