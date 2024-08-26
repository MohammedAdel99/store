import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_product_request.g.dart';

@JsonSerializable()
class UpdateProductRequest {
    String? title;
    int? price;
    String? description;
    int? productId;
    List<String>? images;

    UpdateProductRequest({
        this.title,
        this.price,
        this.description,
        this.productId,
        this.images,
    });
     Map<String, dynamic> toJson() =>
      _$UpdateProductRequestToJson(this);

}
