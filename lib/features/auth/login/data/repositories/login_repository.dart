import 'package:store/core/networking/api_result.dart';
import 'package:store/core/networking/api_service.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/auth/login/data/models/login_request_model.dart';
import 'package:store/features/auth/login/data/models/login_response_model.dart';
import 'package:store/features/auth/login/data/models/user_profile_response_model.dart';



class LoginRepository {
  final ApiService _apiService;
  LoginRepository(
    this._apiService,
  );

  Future<ApiResult<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await _apiService.login(loginRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
    // Future<UserProfileResponse> userProfile(String token) async {
    //   final dio = Dio();
    // dio.options.headers['Authorization'] = 'Bearer $token';
    // final client = ApiService(dio);
    
   
    // final response = await client.userProfile('Bearer $token');
    // return response;
    // }
  }

