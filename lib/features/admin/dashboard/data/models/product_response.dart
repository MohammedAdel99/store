import 'package:freezed_annotation/freezed_annotation.dart';



part 'product_response.g.dart';



@JsonSerializable()
class ProductResponse {
 String? title;

  ProductResponse({
    this.title,
  });
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}

