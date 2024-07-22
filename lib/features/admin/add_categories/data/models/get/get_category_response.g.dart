// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoryResponse _$GetCategoryResponseFromJson(Map<String, dynamic> json) =>
    GetCategoryResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      creationAt: json['creationAt'] == null
          ? null
          : DateTime.parse(json['creationAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$GetCategoryResponseToJson(
        GetCategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'creationAt': instance.creationAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
