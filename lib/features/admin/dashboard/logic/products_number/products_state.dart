import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/dashboard/data/models/product_response.dart';
part  'products_state.freezed.dart';


@freezed
class ProductsState with _$ProductsState {
 
  const factory ProductsState.loading() = Loading;
  const factory ProductsState.success(List<ProductResponse> products) = Success;
  const factory ProductsState.error(ErrorHandler errorHandler) = Error;
}
