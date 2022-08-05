import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  late String userId;
  late String name;
  late String? email;
  late String profilePicUrl;
  late List<String>? imageList;

  UserModel({
    required this.userId,
    required this.name,
    required this.profilePicUrl,
    this.email = "",
    this.imageList = const [],
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
