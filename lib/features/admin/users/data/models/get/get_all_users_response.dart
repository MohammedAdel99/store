import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_users_response.g.dart';
@JsonSerializable()
class GetUserResponse {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;

  GetUserResponse({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
    
  });

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);
}
