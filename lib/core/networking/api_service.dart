import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:store/core/networking/constants.dart';
import 'package:store/core/app/upload_image/model/upload_image_response.dart';
import 'package:store/features/auth/login/data/models/login_request_model.dart';
import 'package:store/features/auth/login/data/models/login_response_model.dart';
import 'package:store/features/auth/signUp/data/models/signup_request_model.dart';
import 'package:store/features/auth/signUp/data/models/signup_response_model.dart';
import 'package:store/features/auth/login/data/models/user_profile_response_model.dart';


part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseurl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
  
  // @GET(ApiConstants.profile)
  // Future<UserProfileResponse> userProfile(@Header('Authorization')  String token);
  @POST(ApiConstants.upload)
  Future<UploadImageResponse> upload(@Body() FormData file);
  @POST(ApiConstants.signup)
  Future<SignUpResponse> signup(@Body() SignUpRequest signUpRequest);
}
