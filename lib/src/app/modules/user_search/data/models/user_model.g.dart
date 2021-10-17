// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int,
    login: json['login'] as String,
    avatarUrl: json['avatar_url'] as String,
    company: json['company'] as String?,
    location: json['location'] as String?,
    twitterUsername: json['twitter_username'] as String?,
    followers: json['followers'] as int?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'company': instance.company,
      'location': instance.location,
      'twitter_username': instance.twitterUsername,
    };
