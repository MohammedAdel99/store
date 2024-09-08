import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';
part  'delete_user_state.freezed.dart';

@freezed
class DeleteUserState with _$DeleteUserState {
  //delete User states
  const factory DeleteUserState.deleteUserInitial() = _DeleteUserInitial;
  const factory DeleteUserState.deleteUserLoading({required String userId}) = DeleteUserLoading;
  const factory DeleteUserState.deleteUserSuccess( ) = DeleteUserSuccess;
  const factory DeleteUserState.deleteUserError(ErrorHandler errorHandler ) = DeleteUserError;
}
