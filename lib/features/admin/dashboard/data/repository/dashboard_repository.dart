import 'dart:convert';
import 'package:store/core/networking/api_result.dart';
import 'package:store/core/networking/api_service.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/dashboard/data/models/user_response.dart';
import 'package:store/features/admin/dashboard/data/models/product_response.dart';
import 'package:store/features/admin/dashboard/data/models/category_response.dart';


class DashboardRepository {
  final ApiService apiService;
  DashboardRepository(
     this.apiService,
  );
   //getAllProducts
  Future<ApiResult<List<ProductResponse>>> getTotalNumOfProducts() async{
    try{
      final response = await apiService.getTotalNumOfProducts();
      
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  } 
   //getAllCategories
   Future<ApiResult<List<CategoryResponse>>> getTotalNumOfCategories() async{
    try{
      final response = await apiService.getTotalNumOfCategories();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  //getAllUsers
   Future<ApiResult<List<UserResponse>>> getTotalNumOfUsers() async{
    try{
      final response = await apiService.getTotalNumOfUsers();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  }  
}