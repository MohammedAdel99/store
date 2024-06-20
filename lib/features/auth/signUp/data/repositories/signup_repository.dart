import 'package:store/core/networking/api_result.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/networking/api_service.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/auth/signUp/data/models/signup_request_model.dart';
import 'package:store/features/auth/signUp/data/models/signup_response_model.dart';

class SignupRepository {
  final ApiService apiService;
  SignupRepository(
     this.apiService,
  );

  Future<ApiResult<SignUpResponse>> signUp(SignUpRequest signUpRequest) async{
    try{
      final response = await apiService.signup(signUpRequest);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  } 
}
