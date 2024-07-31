import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/add_products/data/models/get/get_all_products_response.dart';
import 'package:store/features/admin/add_categories/data/models/get/get_all_categories_response.dart';




part  'get_all_products_state.freezed.dart';
@freezed
class GetAllProductsState with _$GetAllProductsState {
 const factory GetAllProductsState.getProductsLoading() = GetAllProductsLoading;
  const factory GetAllProductsState.getProductsEmpty() = GetAllProductsEmpty;
  const factory GetAllProductsState.getProductsSuccess(List<GetProductResponse> getAllCategories ) = GetAllProductsSuccess;
  const factory GetAllProductsState.getProductsError(ErrorHandler errorHandler ) = GetAllProductsError;

}