import 'package:flutter_clean_sample/features/auth/data/dto/signin_req_params.dart';

import '../../domain/models/user.dart';
import '../data_sources/local/entity/user.dart';
import '../dto/signup_req_params.dart';

extension UserModelMapper on SignupReqParams {
  Map<String, dynamic> signUpDtoToMap() {
    // to send it' should be json in body
    return {
      'email': email,
      'password': password,
      'username': username,
    };
  }
}

extension UserSignInModelMapper on SigninReqParams {
  Map<String, dynamic> signInDtoToMap() {
    // to send it' should be json in body
    return {
      'email': email,
      'password': password,
    };
  }
}

UserModel toUserModelFromSignUpOrSignInMap(Map<String, dynamic> map) {
  // {
  //   "user": {
  //     "username": "qweqwe",
  //     "email": "email23@gmail.com",
  //     "password": "$2a$10$GhnfjL...",
  //     "_id": "67503abdaeb980ba6b81473b",
  //     "__v": 0
  //   },
  //   "token": "eyJhbGciOiJIUzI1Ni..."
  // }
  final userMap = map['user'] as Map<String, dynamic>;
  return UserModel(
    id: userMap['_id'] as String,
    email: userMap['email'] as String,
    username: userMap['username'] as String,
    password: userMap['password'] as String?, // Nullable
    token: map['token'] as String?,          // Top-level token
  );
}

UserModel toUserModelFromMap(Map<String, dynamic> map) {
  return UserModel(
    id: map['_id'] as String,
    email: map['email'] as String,
    username: map['username'] as String,
    password: map['password'] as String?, // Safely handle nullable field
    token: map['token'] as String?,       // Safely handle nullable field
  );
}



// Related to local database
extension UserXModel on UserModel {
  UserEntity toEntity() {
    // user model converting to entity to deal with local database
    return UserEntity(
      id: id,
      email: email,
      username: username,
      password: password,
      token: token,
    );
  }
}

extension UserXEntity on UserEntity {
  UserModel toUserModel() {
    // converting entity to user model to deal on presentation layer
    return UserModel(
      id: id,
      email: email,
      username: username,
      password: password,
      token: token,
    );
  }
}
