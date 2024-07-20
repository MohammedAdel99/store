import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/dashboard/data/models/category_response.dart';
part  'categories_state.freezed.dart';


@freezed
class GetCategoriesState with _$GetCategoriesState {
  const factory GetCategoriesState.loading() = Loading;
  const factory GetCategoriesState.success(List<CategoryResponse> categories) = Success;
  const factory GetCategoriesState.error(ErrorHandler errorHandler) = Error;
}
