import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/admin/dashboard/data/repository/dashboard_repository.dart';
import 'package:store/features/admin/dashboard/logic/categories_number/categories_state.dart';






class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(
    this.dashboardRepository,
  ) : super(CategoriesState.loading());
  final DashboardRepository dashboardRepository;
   @override
  void emit(CategoriesState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  Future<void> getTotalNumOfCategories() async {
    emit(CategoriesState.loading());
    final response = await dashboardRepository.getTotalNumOfCategories();
    await response.when(success: (category) async {
      emit(CategoriesState.
      success(category));
    }, failure: (errorHandler) {
      emit(CategoriesState.error(errorHandler));
    });
  }
}
