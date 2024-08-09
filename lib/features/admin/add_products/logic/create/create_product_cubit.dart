import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/features/admin/add_products/logic/create/create_product_state.dart';
import 'package:store/features/admin/add_products/data/repositories/products_repository.dart';
import 'package:store/features/admin/add_products/data/models/create/create_product_request.dart';

class CreateProductCubit extends Cubit<CreateProductState> {
  CreateProductCubit(this.productsRepository)
      : super(CreateProductState.createProductInitial());
  final ProductsRepository productsRepository;
  @override
  void emit(CreateProductState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController productTitleController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  List<String>? imageList;
  int? categoryId;
  String? categoryName;

  // Create Category
  Future<void> createProduct(CreateProductRequest createProductRequest) async {
    emit(CreateProductState.createProductLoading());

    final response =
        await productsRepository.createProduct(
          CreateProductRequest(
      title: productTitleController.text,
      price: int.parse(productPriceController.text),
      description: productDescriptionController.text,
      images: imageList,
      categoryId: categoryId ?? 0,
    )
    );
    await response.when(success: (createProductResponse) async {
     // print(
         // 'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm${imageList!.first}');
      emit(CreateProductState.createProductSuccess(createProductResponse));
    }, failure: (errorHandler) {
      emit(CreateProductState.createProductError(errorHandler));
    });
  }
}
