import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_category_request.g.dart';

@JsonSerializable()
class UpdateCategoryRequest {
  String id;
  String? name;
  String? image;

  UpdateCategoryRequest({
    required this.id,
    this.name,
    this.image,
  });
  Map<String, dynamic> toJson() => _$UpdateCategoryRequestToJson(this);
}
