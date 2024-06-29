import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/dashboard/logic/users_number/users_state.dart';
import 'package:store/features/admin/dashboard/logic/products_number/products_state.dart';
import 'package:store/features/admin/dashboard/data/repository/dashboard_repository.dart';





class UsersCubit extends Cubit<UsersState> {
  UsersCubit(
    this.dashboardRepository,
  ) : super(UsersState.loading());
  final DashboardRepository dashboardRepository;
   @override
  void emit(UsersState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  Future<void> getTotalNumOfUsers() async {
    emit(UsersState.loading());
    final response = await dashboardRepository.getTotalNumOfUsers();
    await response.when(success: (users) async {
      emit(UsersState.success(users));
    }, failure: (errorHandler) {
      emit(UsersState.error(errorHandler));
    });
  }
}
