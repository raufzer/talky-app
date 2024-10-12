class User {
  final String id;
  final String username;
  final String email;
  final String profilePicture;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.profilePicture,
  });

  factory User.fromJson(jsonData) {
    return User(
      id: jsonData['id'],
      username: jsonData['username'],
      email: jsonData['email'],
      profilePicture: jsonData['profilePicture'],
    );
  }
}