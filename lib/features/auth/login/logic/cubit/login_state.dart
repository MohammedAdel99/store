import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/auth/login/data/models/login_response_model.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(T data) = Success<T>;
  //const factory LoginState.success({required String userRole}) = Success;
  const factory LoginState.error({required String error}) = Error;
}
