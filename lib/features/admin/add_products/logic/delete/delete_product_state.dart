import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';


part  'delete_product_state.freezed.dart';

@freezed
class DeleteProductState with _$DeleteProductState {
  

   //Create Categories
  
   const factory DeleteProductState.deleteProductInitial() = _DeleteProductInitial;
  const factory DeleteProductState.deleteProductLoading({required String productId}) = DeleteProductLoading;
  const factory DeleteProductState.deleteProductSuccess( ) = DeleteProductSuccess;
  const factory DeleteProductState.deleteProductError(ErrorHandler errorHandler ) = DeleteProductError;

}
