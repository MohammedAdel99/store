import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/add_categories/data/models/get_category_response.dart';

part  'get_categories_state.freezed.dart';

@freezed
class GetCategoriesState with _$GetCategoriesState {
  const factory GetCategoriesState.loading() = Loading;
  const factory GetCategoriesState.empty() = Empty;
  const factory GetCategoriesState.success(List<GetCategoryResponse> getAllCategories ) = Success;
  const factory GetCategoriesState.error(ErrorHandler errorHandler ) = Error;
}
