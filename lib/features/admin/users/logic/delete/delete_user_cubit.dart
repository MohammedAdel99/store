import 'package:bloc/bloc.dart';
import 'package:store/features/admin/users/logic/delete/delete_user_state.dart';
import 'package:store/features/admin/users/data/repositories/users_repository.dart';



class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit(
    this.usersRepository,
  ) : super(const DeleteUserState.deleteUserInitial());
 final UsersRepository usersRepository;
  @override
  void emit(DeleteUserState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  // Delete User
  Future<void> deleteUser({required String userId}) async {
    emit(DeleteUserState.deleteUserLoading(userId: userId));

    final response =
        await usersRepository.deleteUser(userId: userId);
    await response.when(success: (_) async {
      emit(const DeleteUserState.deleteUserSuccess());
    }, failure: (errorHandler) {
      emit(DeleteUserState.deleteUserError(errorHandler));
    });
  }
}

