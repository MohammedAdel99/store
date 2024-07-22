import 'package:bloc/bloc.dart';
import 'package:store/features/admin/add_categories/logic/delete/delete_category_state.dart';
import 'package:store/features/admin/add_categories/data/repository/categories_repository.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  DeleteCategoryCubit(this.categoriesRepository)
      : super(const DeleteCategoryState.deleteCategoryInitial());
  final CategoriesRepository categoriesRepository;
  @override
  void emit(DeleteCategoryState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  // Delete Category
  Future<void> deleteCategory({required String categoryId}) async {
    emit(DeleteCategoryState.deleteCategoryLoading(categoryId: categoryId));

    final response =
        await categoriesRepository.deleteCategory(categoryId: categoryId);
    await response.when(success: (_) async {
      emit(const DeleteCategoryState.deleteCategorySuccess());
    }, failure: (errorHandler) {
      emit(DeleteCategoryState.deleteCategoryError(errorHandler));
    });
  }
}
