import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/dashboard/data/models/category_response.dart';
part  'categories_state.freezed.dart';


@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.loading() = Loading;
  const factory CategoriesState.success(List<CategoryResponse> categories) = Success;
  const factory CategoriesState.error(ErrorHandler errorHandler) = Error;
}
