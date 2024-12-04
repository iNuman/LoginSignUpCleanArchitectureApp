import '../../../../domain/models/user.dart';

class UserEntity {
  final String id;
  final String email;
  final String username;
  final String? password;
  final String? token;

  UserEntity({
    required this.id,
    required this.email,
    required this.username,
    this.password, // Optional
    this.token,    // Optional
  });

  @override
  String toString() {
    return 'UserEntity(id: $id, email: $email, username: $username, password: $password, token: $token)';
  }
}

