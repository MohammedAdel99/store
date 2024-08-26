import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/add_products/logic/update/update_product_state.dart';
import 'package:store/features/admin/add_products/data/repositories/products_repository.dart';
import 'package:store/features/admin/add_products/data/models/update/update_product_request.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit(this.productsRepository)
      : super(UpdateProductState.updateProductInitial());
  final ProductsRepository productsRepository;
  @override
  void emit(UpdateProductState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  final formKey = GlobalKey<FormState>();

  TextEditingController productTitleController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  List<String>? imageList;
  int? productId;
  int? categoryId;
  String? categoryName;

  // Update Category
  Future<void> updateProduct(UpdateProductRequest updateProductRequest,
      {required int productId}) async {
    emit(UpdateProductState.updateProductLoading(productId: productId));
    final response = await productsRepository.updateProduct(updateProductRequest
        ,productId: productId);

    //);
    await response.when(success: (_) async {
      emit(UpdateProductState.updateProductSuccess());
    }, failure: (errorHandler) {
      emit(UpdateProductState.updateProductError(errorHandler));
    });
  }
}
