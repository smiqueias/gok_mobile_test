import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String login;
  final String avatarUrl;
  final String? company;
  final String? location;
  final String? twitterUsername;
  final int? followers;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserModel(
      {required this.followers,
      required this.id,
      required this.login,
      required this.avatarUrl,
      required this.company,
      required this.location,
      required this.twitterUsername});

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
