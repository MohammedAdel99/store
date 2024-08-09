import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_product_response.g.dart';

@JsonSerializable()
class CreateProductResponse {
    String? title;
    int? price;
    String? description;
    List<String>? images;
    Category? category;
    int? id;

    CreateProductResponse({
        this.title,
        this.price,
        this.description,
        this.images,
        this.category,
        this.id,
    });
    factory CreateProductResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProductResponseFromJson(json);

}

@JsonSerializable()
class Category {
    int? id;
    String? name;

    Category({
        this.id,
        this.name,
    });
    factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

}
