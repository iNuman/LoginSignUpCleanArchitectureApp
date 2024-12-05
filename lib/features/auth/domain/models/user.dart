import '../../data/data_sources/local/entity/user_entity.dart';

class UserModel {
  final String? id;
  final String email;
  String? username;
  final String? password; // Nullable
  final String? token;    // Nullable

  UserModel({
    this.id,
    required this.email,
    this.username,
    this.password, // Optional
    this.token,    // Optional
  });
}


