 import 'package:json_annotation/json_annotation.dart';
part 'upload_image_response.g.dart';
@JsonSerializable()
class UploadImageResponse {
    
    String? location;
   
    UploadImageResponse({
        
        this.location,
    });
    factory UploadImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseFromJson(json);

}
