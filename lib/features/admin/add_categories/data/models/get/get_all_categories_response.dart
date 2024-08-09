import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_categories_response.g.dart';


//Get Category Response
@JsonSerializable()
class  GetCategoryResponse {
  int? id;
    String? name;
    String? image;
    DateTime? creationAt;
    DateTime? updatedAt;

  GetCategoryResponse({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });
  factory GetCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCategoryResponseFromJson(json);
}


