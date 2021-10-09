import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String login;
  final String avatar_url;
  final String? company;
  final String? location;
  final String? twitter_username;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserModel(
      {
      required this.id,
      required this.login,
      required this.avatar_url,
      required this.company,
      required this.location,
      required this.twitter_username
      });

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
