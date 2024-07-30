import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store/features/admin/add_categories/logic/update/update_category_state.dart';
import 'package:store/features/admin/add_categories/data/repository/categories_repository.dart';
import 'package:store/features/admin/add_categories/data/models/update/update_category_request.dart';

class UpdateCategoryCubit extends Cubit<UpdateCategoryState> {
  UpdateCategoryCubit(this.categoriesRepository)
      : super(UpdateCategoryState.updateCategoryInitial());
  final CategoriesRepository categoriesRepository;
  @override
  void emit(UpdateCategoryState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  final formKey = GlobalKey<FormState>();

  TextEditingController categoryNameController = TextEditingController();
  String imageUrl ='';

  // Create Category
  Future<void> updateCategory(
    UpdateCategoryRequest updateCategoryRequest,
      {required String categoryId})
      
      async {
    emit(UpdateCategoryState.updateCategoryLoading(categoryId: categoryId));
    final response = await categoriesRepository.updateCategory( UpdateCategoryRequest(id: categoryId, name: categoryNameController.text, image: imageUrl) ,CategoryId: categoryId);
    //await categoriesRepository.updateCategory(CategoryId: categoryId, 
        
        //updateCategoryRequest: UpdateCategoryRequest()
        //);
    await response.when(success: (_) async {
      emit(UpdateCategoryState.updateCategorySuccess());
    }, failure: (errorHandler) {
      emit(UpdateCategoryState.updateCategoryError(errorHandler));
    });
  }
}
