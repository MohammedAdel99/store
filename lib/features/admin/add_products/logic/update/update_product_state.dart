import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';




part  'update_product_state.freezed.dart';

@freezed
class UpdateProductState with _$UpdateProductState {
  

   //Update Products
  
   const factory UpdateProductState.updateProductInitial() = _UpdateProductInitial;
  const factory UpdateProductState.updateProductLoading({required int productId}) = UpdateProductLoading;
  const factory UpdateProductState.updateProductSuccess() = UpdateProductSuccess;
  const factory UpdateProductState.updateProductError(ErrorHandler errorHandler ) = UpdateProductError;

}
