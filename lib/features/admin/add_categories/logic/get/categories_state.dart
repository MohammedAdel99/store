import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/add_categories/data/models/get/get_category_response.dart';


part  'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  // Get Categories
  const factory CategoriesState.getCategoriesLoading() = GetCategoriesLoading;
  const factory CategoriesState.getCategoriesEmpty() = GetCategoriesEmpty;
  const factory CategoriesState.getCategoriesSuccess(List<GetCategoryResponse> getCategories ) = GetCategoriesSuccess;
  const factory CategoriesState.getCategoriesError(ErrorHandler errorHandler ) = GetCategoriesError;

}
