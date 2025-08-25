class UserModel {
  final String id;
  final String username;
  final String email;
  final String? token;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username, 'email': email, 'token': token};
  }

  UserModel copyWith({
    String? id,
    String? username,
    String? email,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }
}
