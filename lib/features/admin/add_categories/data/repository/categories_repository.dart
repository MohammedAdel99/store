import 'package:store/core/networking/api_result.dart';
import 'package:store/core/networking/api_service.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/dashboard/data/models/category_response.dart';
import 'package:store/features/admin/add_categories/data/models/get_category_response.dart';

class CategoriesRepository {
  final ApiService apiService;
  CategoriesRepository(
     this.apiService,
  );
  

   //getAllCategories
   Future<ApiResult<List<GetCategoryResponse>>> getAllCategories() async{
    try{
      final response = await apiService.getAllCategories();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
 
}