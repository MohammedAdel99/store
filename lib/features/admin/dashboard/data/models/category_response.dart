import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  String? name;

  CategoryResponse({
    this.name,
  });
  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}
