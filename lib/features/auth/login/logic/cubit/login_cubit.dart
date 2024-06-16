import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store/core/networking/dio_factory.dart';
import 'package:store/core/helpers/shared_pref/shared_pref_keys.dart';
import 'package:store/core/helpers/shared_pref/shared_pref_helper.dart';
import 'package:store/features/auth/login/logic/cubit/login_state.dart';
import 'package:store/features/auth/login/data/models/login_request_model.dart';
import 'package:store/features/auth/login/data/repositories/login_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;
  LoginCubit(this._loginRepository) : super(LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> emitLoginState(LoginRequest loginRequest) async {
    emit(const LoginState.loading());
    final response = await _loginRepository.login(loginRequest);
    await response.when(
      success: (loginResponse) async {
        var token = loginResponse.accessToken.toString();
//var user = await _loginRepository.userProfile(token);
        await saveUserToken(token);

        // await SharedPref.setInt(SharedPrefKeys.userId, user.userId ?? 0);
        // await SharedPref.setString(SharedPrefKeys.userRole, user.userRole.toString());

        // emit(LoginState.success(userRole: user.userRole.toString() ));
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPref.setString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenAfterLogin(token);
  }
}
