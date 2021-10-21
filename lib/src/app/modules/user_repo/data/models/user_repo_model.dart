import 'package:equatable/equatable.dart';

class UserRepoModel extends Equatable {
  final int id;
  final String? name;
  final String? language;
  final String? description;
  final String createdAt;
  final String htmlUrl;
  final int stargazersCount;
  final int watchersCount;

  

  const UserRepoModel({
    required this.description,
    required this.id,
    required this.htmlUrl,
    required this.name,
    required this.language,
    required this.stargazersCount,
    required this.createdAt,
    required this.watchersCount,
  });

  factory UserRepoModel.fromJson(Map<String, dynamic> json) {
    return UserRepoModel(
      id: json['id'],
      name: json['name'] ?? "Não informado",
      language: json['language'] ?? "Não informado",
      stargazersCount: json['stargazers_count'],
      createdAt: json['created_at'],
      watchersCount: json['watchers_count'],
      description: json['description'] ?? "Não informado",
      htmlUrl: json['html_url'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        language,
        stargazersCount,
        createdAt,
        watchersCount,
      ];

  UserRepoModel copyWith({
    int? id,
    String? name,
    String? language,
    String? description,
    String? createdAt,
    String? htmlUrl,
    int? stargazersCount,
    int? watchersCount,
  }) {
    return UserRepoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      language: language ?? this.language,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      stargazersCount: stargazersCount ?? this.stargazersCount,
      watchersCount: watchersCount ?? this.watchersCount,
    );
  }
}
