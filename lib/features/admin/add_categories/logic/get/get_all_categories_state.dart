import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/add_categories/data/models/get/get_all_categories_response.dart';


part  'get_all_categories_state.freezed.dart';


  
  
@freezed
class GetAllCategoriesState with _$GetAllCategoriesState {
  
  const factory GetAllCategoriesState.getCategoriesLoading() = GetAllCategoriesLoading;
  const factory GetAllCategoriesState.getCategoriesEmpty() = GetAllCategoriesEmpty;
  const factory GetAllCategoriesState.getCategoriesSuccess(List<GetAllCategoryResponse> getAllCategories ) = GetAllCategoriesSuccess;
  const factory GetAllCategoriesState.getCategoriesError(ErrorHandler errorHandler ) = GetAllCategoriesError;

}
 
