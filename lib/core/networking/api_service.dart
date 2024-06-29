import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:store/core/networking/constants.dart';
import 'package:store/core/app/upload_image/model/upload_image_response.dart';
import 'package:store/features/admin/dashboard/data/models/user_response.dart';
import 'package:store/features/auth/login/data/models/login_request_model.dart';
import 'package:store/features/auth/login/data/models/login_response_model.dart';
import 'package:store/features/auth/signUp/data/models/signup_request_model.dart';
import 'package:store/features/admin/dashboard/data/models/product_response.dart';
import 'package:store/features/auth/signUp/data/models/signup_response_model.dart';
import 'package:store/features/admin/dashboard/data/models/category_response.dart';
import 'package:store/features/admin/add_categories/data/models/get_category_response.dart';



part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseurl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  //(Login)
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
  
  // @GET(ApiConstants.profile)
  // Future<UserProfileResponse> userProfile(@Header('Authorization')  String token);
  //(Upload)
  @POST(ApiConstants.upload)
  Future<UploadImageResponse> upload(@Body() FormData file);
  //(Signup)
  @POST(ApiConstants.signup)
  Future<SignUpResponse> signup(@Body() SignUpRequest signUpRequest);
   //(Dashboard) get Total Number of Products
   @GET(ApiConstants.getAllProducts)
   Future<List<ProductResponse>> getTotalNumOfProducts ();
   //(Dashboard) get Total Number of Categories
   @GET(ApiConstants.getAllCategories)
   Future<List<CategoryResponse>> getTotalNumOfCategories ();
   //(Dashboard) get Total Number of Users
   @GET(ApiConstants.getAllUsers)
   Future<List<UserResponse>> getTotalNumOfUsers ();
   //(AddCategories) Get all Categories
   @GET(ApiConstants.getAllCategories)
   Future<List<GetCategoryResponse>> getAllCategories ();

}
