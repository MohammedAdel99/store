import 'package:json_annotation/json_annotation.dart';
part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequest {
  String? email;
  String? password;

  LoginRequest({required this.email,required this.password,});
  Map<String, dynamic> toJson() =>
      _$LoginRequestToJson(this);
}
