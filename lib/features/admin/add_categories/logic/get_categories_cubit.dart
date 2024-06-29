import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../dashboard/logic/categories_number/categories_state.dart';
import 'package:store/features/admin/add_categories/logic/get_categories_state.dart';
import 'package:store/features/admin/add_categories/data/models/get_category_response.dart';
import 'package:store/features/admin/add_categories/data/repository/categories_repository.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(this.categoriesRepository)
      : super(const GetCategoriesState.loading());
  final CategoriesRepository categoriesRepository;
  @override
  void emit(GetCategoriesState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  Future<void> GetAllCategories() async {
    emit(const GetCategoriesState.loading());
    final response = await categoriesRepository.getAllCategories();
    await response.when(success: (categories) async {
      if (categories.isNotEmpty) {
        emit(GetCategoriesState.success(categories));
      } else {
        emit(GetCategoriesState.empty());
      }
    }, failure: (errorHandler) {
      emit(GetCategoriesState.error(errorHandler));
    });
  }
}
