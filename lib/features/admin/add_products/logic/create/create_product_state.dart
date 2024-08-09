import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/add_products/data/models/create/create_product_response.dart';
import 'package:store/features/admin/add_categories/data/models/create/create_category_response.dart';


part  'create_product_state.freezed.dart';

@freezed
class CreateProductState with _$CreateProductState {
 const factory CreateProductState.createProductInitial() = _CreateProductInitial;
  const factory CreateProductState.createProductLoading() = CreateProductLoading;
  const factory CreateProductState.createProductSuccess(CreateProductResponse createProductResponse ) = CreateProductSuccess;
  const factory CreateProductState.createProductError(ErrorHandler errorHandler ) = CreateProductError;
}
