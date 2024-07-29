import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_categories_response.g.dart';

@JsonSerializable()
class  GetAllCategoryResponse {
  int? id;
    String? name;
    String? image;
    DateTime? creationAt;
    DateTime? updatedAt;

  GetAllCategoryResponse({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });
  factory GetAllCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoryResponseFromJson(json);
}


