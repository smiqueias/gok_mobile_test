import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String login;
  final String avatarUrl;
  final String? company;
  final String? location;
  final String? twitterUsername;
  final int? followers;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        avatarUrl: json['avatar_url'] ?? "",
        company: json['company'] ?? "Não informado",
        followers: json['followers'] ?? "Não informado",
        id: json['id'],
        location: json['location'] ?? "Não informado",
        login: json['login'] ?? "Não informado",
        twitterUsername: json['twitter_username'] ?? "Não informado",
      );

  const UserModel(
      {required this.followers,
      required this.id,
      required this.login,
      required this.avatarUrl,
      required this.company,
      required this.location,
      required this.twitterUsername});

  @override
  List<Object?> get props =>
      [id, login, avatarUrl, company, location, twitterUsername, followers];
}
