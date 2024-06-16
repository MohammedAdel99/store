import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponse {
  String? accessToken;
  String? refreshToken;
    

    LoginResponse({
        this.accessToken,
        this.refreshToken,
    });
    
     factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

}
