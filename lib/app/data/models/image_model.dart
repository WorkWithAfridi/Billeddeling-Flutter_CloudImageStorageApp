import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  late String imageId;
  late String userId;
  late String title;
  late String date;
  late String url;
  ImageModel({
    required this.imageId,
    required this.userId,
    required this.title,
    required this.date,
    required this.url,
  });
  factory ImageModel.fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>;
    return _$ImageModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
