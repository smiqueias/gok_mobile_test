// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int,
    login: json['login'] as String,
    avatar_url: json['avatar_url'] as String,
    company: json['company'] as String?,
    location: json['location'] as String?,
    twitter_username: json['twitter_username'] as String?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatar_url,
      'company': instance.company,
      'location': instance.location,
      'twitter_username': instance.twitter_username,
    };
