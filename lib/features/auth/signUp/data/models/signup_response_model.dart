import 'package:json_annotation/json_annotation.dart';

part 'signup_response_model.g.dart';

@JsonSerializable()
class SignUpResponse {
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  int? id;
  DateTime? creationAt;
  DateTime? updatedAt;

  SignUpResponse({
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
    this.id,
    this.creationAt,
    this.updatedAt,
  });
  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}
