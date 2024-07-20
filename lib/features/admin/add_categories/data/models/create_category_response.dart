import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_category_response.g.dart';

@JsonSerializable()
class  CreateCategoryResponse {
  int? id;
    String? name;
    String? image;
    DateTime? creationAt;
    DateTime? updatedAt;

  CreateCategoryResponse({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });
  factory CreateCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryResponseFromJson(json);
}

