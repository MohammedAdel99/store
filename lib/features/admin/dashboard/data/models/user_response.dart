import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_response.g.dart';


@JsonSerializable()
class UserResponse {
  String? name;

  UserResponse({
    this.name,
  });
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}


  

