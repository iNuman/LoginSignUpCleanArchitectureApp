import '../../data/data_sources/local/entity/user.dart';

class UserModel {
  final String id;
  final String email;
  final String username;
  final String? password; // Nullable
  final String? token;    // Nullable

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    this.password, // Optional
    this.token,    // Optional
  });
}


