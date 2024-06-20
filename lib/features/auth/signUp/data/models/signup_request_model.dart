import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_request_model.g.dart';

@JsonSerializable()
class SignUpRequest {
  String? name;
  String? email;
  String? password;
  String? avatar;
  String? role;

  SignUpRequest({
    this.name,
    this.email,
    this.password,
    this.avatar,
    this.role,
  });
  Map<String, dynamic> toJson() =>
      _$SignUpRequestToJson(this);
}
