import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_category_request.g.dart';

@JsonSerializable()
class CreateCategoryRequest {
    String? name;
    String? image;

    CreateCategoryRequest({
        this.name,
        this.image,
    });
  Map<String, dynamic> toJson() =>
      _$CreateCategoryRequestToJson(this);
}
