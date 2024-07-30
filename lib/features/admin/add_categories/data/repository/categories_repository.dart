import 'package:store/core/networking/api_result.dart';
import 'package:store/core/networking/api_service.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/dashboard/data/models/category_response.dart';
import 'package:store/features/admin/add_categories/data/models/delete/delete_category.dart';
import 'package:store/features/admin/add_categories/data/models/update/update_category_request.dart';
import 'package:store/features/admin/add_categories/data/models/create/create_category_request.dart';
import 'package:store/features/admin/add_categories/data/models/get/get_all_categories_response.dart';
import 'package:store/features/admin/add_categories/data/models/create/create_category_response.dart';




class CategoriesRepository {
  final ApiService apiService;
  CategoriesRepository(
    this.apiService,
  );

  //getAllCategories
  Future<ApiResult<List<GetAllCategoryResponse>>> getAllCategories() async {
    try {
      final response = await apiService.getAllCategories();
      return ApiResult.success(response.reversed.toList());
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  //Create Category
  Future<ApiResult<CreateCategoryResponse>> createCategory(
      CreateCategoryRequest createCategoryRequest) async {
    try {
      final response = await apiService.createCategory(createCategoryRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  //Delete Category
  Future<ApiResult<void>> deleteCategory({required String categoryId}) async {
    try {
      final response = await apiService.deleteCategory(
          CategoriesQueries().deleteMapQuery(categoryId: categoryId));
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  //Update Category
  Future<ApiResult<void>> updateCategory(UpdateCategoryRequest updateCategoryRequest,{required String CategoryId}) async {
    try {
      final response = await apiService.updateCategory(CategoryId, updateCategoryRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
