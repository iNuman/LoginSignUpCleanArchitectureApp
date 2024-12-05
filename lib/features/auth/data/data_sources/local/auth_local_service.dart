import 'package:dartz/dartz.dart';
import 'package:flutter_clean_sample/features/auth/data/data_sources/local/entity/user_entity.dart';
import 'package:flutter_clean_sample/features/auth/data/mapper/mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/models/user.dart';

abstract class AuthLocalService {
  Future<bool> isLoggedIn();
  Future<Either> logout();
  Future<UserModel?> getUserFromLocal();
  Future<UserModel?> saveUserToLocal(UserEntity userEntity);
}


class AuthLocalServiceImpl extends AuthLocalService {


  @override
  Future<bool> isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if (token  == null ){
      return false;
    } else {
      return true;
    }
  }
  @override
  Future<UserModel?> getUserFromLocal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString('id');
    var email = sharedPreferences.getString('email');
    var username = sharedPreferences.getString('username');
    var token = sharedPreferences.getString('token');
    var password = sharedPreferences.getString('password');

    if (id != null && email != null && username != null) {
      return UserEntity(
        id: id,
        email: email,
        username: username,
        token: token,
        password: password
      ).toUserModel();
    }
    return null;
  }

  @override
  Future<UserModel?> saveUserToLocal(UserEntity userEntity) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('id', userEntity.id);
    sharedPreferences.setString('email', userEntity.email);
    sharedPreferences.setString('username', userEntity.username);
    if (userEntity.password != null) {
      sharedPreferences.setString('password', userEntity.password!);
    }
    if (userEntity.token != null) {
      sharedPreferences.setString('token', userEntity.token!);
    }

    return userEntity.toUserModel();
  }


  @override
  Future<Either> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await deleteUserFromLocal();
    sharedPreferences.clear();
    return const Right(true);
  }

  Future<void> deleteUserFromLocal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('id');
    sharedPreferences.remove('email');
    sharedPreferences.remove('username');
    sharedPreferences.remove('password');
    sharedPreferences.remove('token');
  }
}
