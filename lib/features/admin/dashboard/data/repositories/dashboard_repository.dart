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
  Future<ApiResult<List<ProductResponse>>> getProducts() async{
    try{
      final response = await apiService.getAllProducts();
      
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  } 
   //getAllCategories
   Future<ApiResult<List<CategoryResponse>>> getAllCategories() async{
    try{
      final response = await apiService.getAllCategories();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  //getAllUsers
   Future<ApiResult<List<UserResponse>>> getAllUsers() async{
    try{
      final response = await apiService.getAllUsers();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  }  
}