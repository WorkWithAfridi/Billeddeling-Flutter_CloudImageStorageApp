// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      postId: json['postId'] as String,
      imageId: json['imageId'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'postId': instance.postId,
      'imageId': instance.imageId,
      'userId': instance.userId,
      'title': instance.title,
      'date': instance.date,
      'url': instance.url,
    };
