// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      imageId: json['imageId'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'imageId': instance.imageId,
      'userId': instance.userId,
      'title': instance.title,
      'date': instance.date,
      'url': instance.url,
    };
