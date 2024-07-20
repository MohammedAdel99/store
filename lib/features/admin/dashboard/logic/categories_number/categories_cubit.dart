import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/admin/dashboard/data/repository/dashboard_repository.dart';
import 'package:store/features/admin/dashboard/logic/categories_number/categories_state.dart';






class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(
    this.dashboardRepository,
  ) : super(GetCategoriesState.loading());
  final DashboardRepository dashboardRepository;
   @override
  void emit(GetCategoriesState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  Future<void> getTotalNumOfCategories() async {
    emit(GetCategoriesState.loading());
    final response = await dashboardRepository.getTotalNumOfCategories();
    await response.when(success: (categories) async {
      emit(GetCategoriesState.
      success(categories));
    }, failure: (errorHandler) {
      emit(GetCategoriesState.error(errorHandler));
    });
  }
}
