import 'package:bloc/bloc.dart';
import 'package:store/features/admin/add_products/logic/delete/delete_product_state.dart';
import 'package:store/features/admin/add_products/data/repositories/products_repository.dart';


class DeleteProductCubit extends Cubit<DeleteProductState> {
  DeleteProductCubit(this.productsRepository)
      : super(const DeleteProductState.deleteProductInitial());
  final ProductsRepository productsRepository;
  @override
  void emit(DeleteProductState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  // Delete Product
  Future<void> deleteProduct({required String productId}) async {
    emit(DeleteProductState.deleteProductLoading(productId: productId));

    final response =
        await productsRepository.deleteProduct(productId: productId);
    await response.when(success: (_) async {
      emit(const DeleteProductState.deleteProductSuccess());
    }, failure: (errorHandler) {
      emit(DeleteProductState.deleteProductError(errorHandler));
    });
  }
}
