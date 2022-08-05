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
  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
