import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store/features/admin/add_categories/logic/create/create_category_state.dart';
import 'package:store/features/admin/add_categories/data/models/create_category_request.dart';
import 'package:store/features/admin/add_categories/data/repository/categories_repository.dart';





class CreateCategoryCubit extends Cubit<CreateCategoryState> {
  CreateCategoryCubit(this.categoriesRepository)
      : super(CreateCategoryState.createCategoryInitial() );
  final CategoriesRepository categoriesRepository;
  @override
  void emit(CreateCategoryState state) {
    if (!isClosed) {
      super.emit(state);
    }
  
  }
  final formKey = GlobalKey<FormState>();
  TextEditingController categoryNameController = TextEditingController();
  String? imageUrl;
  

  // Create Category
  Future<void> createCategory(CreateCategoryRequest createCategoryRequest) async {
    
    final response = await categoriesRepository.createCategory(CreateCategoryRequest(
      name: categoryNameController.text ,image: imageUrl));
    await response.when(success: (createCategoryResponse) async {
      
        emit(CreateCategoryState.createCategorySuccess(createCategoryResponse));
     
    }, failure: (errorHandler) {
      emit(CreateCategoryState.createCategoryError(errorHandler));
    });
  }
}
