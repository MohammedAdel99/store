import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_profile_response_model.g.dart';

@JsonSerializable()
class UserProfileResponse {
  @JsonKey(name: 'id')
  int? userId;
  @JsonKey(name:'role')
  String? userRole;

  UserProfileResponse({
    this.userId,
      this.userRole

    });
    factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
     _$UserProfileResponseFromJson(json);

}