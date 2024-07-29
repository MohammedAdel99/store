// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCategoryRequest _$UpdateCategoryRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateCategoryRequest(
      id: json['id'] as String,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UpdateCategoryRequestToJson(
        UpdateCategoryRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
