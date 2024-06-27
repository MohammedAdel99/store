import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/dashboard/data/models/user_response.dart';
part  'users_state.freezed.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.loading() = Loading;
  const factory UsersState.success(List<UserResponse> users) = Success;
  const factory UsersState.error(ErrorHandler errorHandler) = Error;
}
