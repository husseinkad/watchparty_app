class Movie {
  final String id;
  final String movieName;
  final String movieURL;
  final String description;
  final List<String> tags;
  final Owner owner;
  final DateTime createdAt;
  final DateTime updatedAt;

  Movie({
    required this.id,
    required this.movieName,
    required this.movieURL,
    required this.description,
    required this.tags,
    required this.owner,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['_id'],
      movieName: json['movieName'],
      movieURL: json['movieURL'],
      description: json['description'],
      tags: List<String>.from(json['tags']),
      owner: Owner.fromJson(json['owner']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class Owner {
  final String id;
  final String displayName;
  final String profilePicture;
  final String email;
  final String password;

  Owner({
    required this.id,
    required this.displayName,
    required this.profilePicture,
    required this.email,
    required this.password,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['_id'],
      displayName: json['displayName'],
      profilePicture: json['profilePicture'],
      email: json['email'],
      password: json['password'],
    );
  }
}
