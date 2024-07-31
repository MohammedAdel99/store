import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_state.dart';
import 'package:store/features/admin/add_categories/data/repository/categories_repository.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit(this.categoriesRepository)
      : super(GetAllCategoriesState.getCategoriesLoading());
  final CategoriesRepository categoriesRepository;
  @override
  void emit(GetAllCategoriesState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }


 
  // Get Categories
  Future<void> getAllCategories() async {
    emit(const GetAllCategoriesState.getCategoriesLoading());
    final response = await categoriesRepository.getAllCategories();
    await response.when(success: (categories) async {
      emit(GetAllCategoriesState.getCategoriesSuccess(categories));
    }, failure: (errorHandler) {
      emit(GetAllCategoriesState.getCategoriesError(errorHandler));
    });
  }
}
