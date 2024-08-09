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
import 'package:store/features/admin/add_products/data/models/create/create_product_request.dart';
import 'package:store/features/admin/add_products/data/models/get/get_all_products_response.dart';
import 'package:store/features/admin/add_products/data/models/create/create_product_response.dart';
import 'package:store/features/admin/add_categories/data/models/update/update_category_request.dart';
import 'package:store/features/admin/add_categories/data/models/create/create_category_request.dart';
import 'package:store/features/admin/add_categories/data/models/get/get_all_categories_response.dart';
import 'package:store/features/admin/add_categories/data/models/create/create_category_response.dart';


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
  //(Dashboard) => get Total Number of Products
  @GET(ApiConstants.getAllProducts)
  Future<List<ProductResponse>> getTotalNumOfProducts();
  //(Dashboard) => get Total Number of Categories
  @GET(ApiConstants.getAllCategories)
  Future<List<CategoryResponse>> getTotalNumOfCategories();
  //(Dashboard) => get Total Number of Users
  @GET(ApiConstants.getAllUsers)
  Future<List<UserResponse>> getTotalNumOfUsers();
  //(Add_Categories) =>Get all Categories
  @GET(ApiConstants.getAllCategories)
  Future<List<GetCategoryResponse>>getAllCategories();
  //(Add_Categories) => Create category
  @POST(ApiConstants.getAllCategories)
  Future<CreateCategoryResponse> createCategory(
      @Body() CreateCategoryRequest createCategoryRequest);
  //(Add_Categories) => Delete category
  @POST(ApiConstants.graphql)
  Future<void> deleteCategory(@Body() Map<String, dynamic> mutation);
  //(Add_Categories) => Update category
  @PUT('${ApiConstants.getAllCategories}{id}')
  Future<void> updateCategory(@Path('id') String CategoryId,
      @Body() UpdateCategoryRequest updateCategoryRequest);
  @GET(ApiConstants.getAllProducts)
  Future<List<GetProductResponse>> getAllProducts();
  //(Add_Products) => Create Product
  @POST(ApiConstants.getAllProducts)
  Future<CreateProductResponse> createProduct(
      @Body() CreateProductRequest createProductRequest);  
    //(Add_Categories) => Delete category
  @POST(ApiConstants.graphql)
  Future<void> deleteProduct(@Body() Map<String, dynamic> mutation);      
}
