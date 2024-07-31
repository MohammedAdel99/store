import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_products_response.g.dart';
@JsonSerializable()
class GetProductResponse{
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  Category? category;

  GetProductResponse(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.images,
      this.creationAt,
      this.updatedAt,
      this.category});

factory GetProductResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductResponseFromJson(json);
}
 
@JsonSerializable()
class Category {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({this.id, this.name, this.image, this.creationAt, this.updatedAt});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}