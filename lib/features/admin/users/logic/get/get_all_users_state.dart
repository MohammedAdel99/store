import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/users/data/models/get/get_all_users_response.dart';




part  'get_all_users_state.freezed.dart';
@freezed
class GetAllUsersState with _$GetAllUsersState {
 const factory GetAllUsersState.getUsersLoading() = GetAllUsersLoading;
  const factory GetAllUsersState.getUsersEmpty() = GetAllUsersEmpty;
  const factory GetAllUsersState.getUsersSuccess(List<GetUserResponse> getAllUsers ) = GetAllUsersSuccess;
  const factory GetAllUsersState.getUsersError(ErrorHandler errorHandler ) = GetAllUsersError;
   const factory GetAllUsersState.searchForUser(List<GetUserResponse> getUsers ) = SearchForUser;
}