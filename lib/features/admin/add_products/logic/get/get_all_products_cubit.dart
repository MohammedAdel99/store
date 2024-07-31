import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/add_products/logic/get/get_all_products_state.dart';
import 'package:store/features/admin/add_products/data/repositories/products_repository.dart';
class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit(this.productsRepository)
      : super(GetAllProductsState.getProductsLoading());
  final ProductsRepository productsRepository;
  @override
  void emit(GetAllProductsState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }


 
  // Get Categories
  Future<void> getAllProducts() async {
    emit(const GetAllProductsState.getProductsLoading());
    final response = await productsRepository.getAllProducts();
    await response.when(success: (products) async {
      emit(GetAllProductsState.getProductsSuccess(products));
    }, failure: (errorHandler) {
      emit(GetAllProductsState.getProductsError(errorHandler));
    });
  }
}
