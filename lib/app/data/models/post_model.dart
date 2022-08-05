import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  late String postId;
  late String imageId;
  late String userId;
  late String title;
  late String date;
  late String url;
  PostModel({
    required this.postId,
    required this.imageId,
    required this.userId,
    required this.title,
    required this.date,
    required this.url,
  });
  factory PostModel.fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>;
    return _$PostModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
