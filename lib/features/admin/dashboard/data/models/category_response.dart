import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  int? id;
    String? name;
    String? image;
    DateTime? creationAt;
    DateTime? updatedAt;

  CategoryResponse({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });
  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}


