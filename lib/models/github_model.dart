class GitHub {
  final String userName;
  final String name;
  final String bio;
  final String avatar;
  final String location;
  final int publicRepositorys;
  final int followers;
  final int following;

  GitHub({
    required this.userName,
    required this.name,
    required this.bio,
    required this.avatar,
    required this.location,
    required this.publicRepositorys,
    required this.followers,
    required this.following
  });

  factory GitHub.fromJson(Map<String, dynamic> json) {
    return GitHub(
      userName: json['login'] ?? 'No username', 
      name: json['name'] ?? 'Not provided', 
      bio: json['bio'] ?? 'No bio', 
      avatar: json['avatar_url'] ?? '',
      location: json['location'] ?? '',
      publicRepositorys: json['public_repos'] ?? 0, 
      followers: json['followers'] ?? 0, 
      following: json['following'] ?? 0
    );
  }
}