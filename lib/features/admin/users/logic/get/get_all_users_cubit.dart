import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store/features/admin/users/logic/get/get_all_users_state.dart';
import 'package:store/features/admin/users/data/repositories/users_repository.dart';
import 'package:store/features/admin/users/data/models/get/get_all_users_response.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersState> {
  GetAllUsersCubit(this.usersRepository)
      : super(GetAllUsersState.getUsersLoading());
  final UsersRepository usersRepository;
 
  @override
  void emit(GetAllUsersState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  TextEditingController textSearchController = TextEditingController();
  List<GetUserResponse> userList = [];

  // Get Users
  Future<void> getAllUsers(
    {required bool isNotLoading}
    ) async {
    if (isNotLoading == false) {
      emit(const GetAllUsersState.getUsersLoading());
   }
    final response = await usersRepository.getAllUsers();
    await response.when(success: (users) async {
      if (users.isEmpty) {
        emit(GetAllUsersState.getUsersEmpty());
      } else {
        userList = users;
        emit(GetAllUsersState.getUsersSuccess(userList));
      }
    }, failure: (errorHandler) {
      emit(GetAllUsersState.getUsersError(errorHandler));
    });
  }

  // Search Users
  Future<void> SearchUser(String? textSearch) async {
    //emit(const GetAllUsersState.getUsersLoading());

    final searchList = userList
        .where((element) =>
            element.name!
                .toLowerCase()
                .startsWith(textSearchController.text.toLowerCase().trim()) ||
            element.email!
                .toLowerCase()
                .startsWith(textSearchController.text.toLowerCase().trim()))
        .toList();
    if (searchList.isEmpty) {
      emit(GetAllUsersState.getUsersEmpty());
    } else {
      emit(GetAllUsersState.getUsersSuccess(searchList));
    }
  }
}
