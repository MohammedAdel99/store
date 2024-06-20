import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/networking/api_service.dart';
import 'package:store/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:store/features/auth/login/logic/cubit/login_state.dart';
import 'package:store/features/auth/signUp/logic/cubit/signup_state.dart';
import 'package:store/features/auth/login/data/models/login_request_model.dart';
import 'package:store/features/auth/login/data/models/login_response_model.dart';
import 'package:store/features/auth/signUp/data/models/signup_request_model.dart';
import 'package:store/features/auth/login/data/repositories/login_repository.dart';
import 'package:store/features/auth/signUp/data/repositories/signup_repository.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepository signUpRepository;
  SignupCubit(this.signUpRepository) : super(const SignupState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  LoginRepository loginRepository = LoginRepository(ApiService(Dio()));


  String? imageUrl;
  //TextEditingController roleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> emitSignupStates(SignUpRequest signUpRequest) async {
    emit(SignupState.loading());
    final response = await signUpRepository.signUp(SignUpRequest(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        avatar: imageUrl));
    await response.when(success: (signUpResponse) async {
       emit(SignupState.success(signUpResponse));
     
    }, failure: (error) {
      emit(SignupState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
