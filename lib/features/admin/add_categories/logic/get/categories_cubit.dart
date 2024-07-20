import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store/features/admin/add_categories/logic/get/categories_state.dart';
import 'package:store/features/admin/add_categories/data/models/create_category_request.dart';
import 'package:store/features/admin/add_categories/data/repository/categories_repository.dart';





class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.categoriesRepository)
      : super(CategoriesState.getCategoriesLoading() );
  final CategoriesRepository categoriesRepository;
  @override
  void emit(CategoriesState state) {
    if (!isClosed) {
      super.emit(state);
    }
  
  }
  TextEditingController categoryNameController = TextEditingController();
  String? imageUrl;
  // Get Categories
  Future<void> getCategories() async {
    emit(const CategoriesState.getCategoriesLoading());
    final response = await categoriesRepository.getAllCategories();
    await response.when(success: (categories) async {
      
        emit(CategoriesState.getCategoriesSuccess(categories));
     
    }, failure: (errorHandler) {
      emit(CategoriesState.getCategoriesError(errorHandler));
    });
  
 
    
  }
}
