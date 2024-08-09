import 'package:bloc/bloc.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_state.dart';
import 'package:store/features/admin/add_categories/data/repository/categories_repository.dart';
import 'package:store/features/admin/add_categories/data/models/get/get_all_categories_response.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit(this.categoriesRepository)
      : super(GetAllCategoriesState.getCategoriesLoading());
  final CategoriesRepository categoriesRepository;
  
  List<GetCategoryResponse> getAllCategoryResponse = [];
  List<String> categoryDropdownList = [];

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
      getAllCategoryResponse = categories;
      categoryDropdownList = getAllCategoryResponse.map((e) => e.name ?? '').toList();

      if (getAllCategoryResponse.isEmpty) {
        emit(const GetAllCategoriesState.getCategoriesEmpty());
      } else {
        emit(GetAllCategoriesState.getCategoriesSuccess(categories));
      }
    }, failure: (errorHandler) {
      emit(GetAllCategoriesState.getCategoriesError(errorHandler));
    });
  }
}
