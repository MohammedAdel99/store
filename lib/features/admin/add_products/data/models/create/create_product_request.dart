import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_product_request.g.dart';

@JsonSerializable()
class CreateProductRequest {
    String? title;
    int? price;
    String? description;
    int? categoryId;
    List<String>? images;

    CreateProductRequest({
        this.title,
        this.price,
        this.description,
        this.categoryId,
        this.images,
    });
     Map<String, dynamic> toJson() =>
      _$CreateProductRequestToJson(this);

}
