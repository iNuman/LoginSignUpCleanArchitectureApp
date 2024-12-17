import 'package:dartz/dartz.dart';
import 'package:flutter_clean_sample/features/auth/data/dto/signin_req_params.dart';
import 'package:flutter_clean_sample/features/auth/domain/models/user.dart';

import '../../data/dto/signup_req_params.dart';

abstract class AuthRepository {
  
  Future<Either> signup(UserModel signupReq);
  Future<Either> signin(UserModel signinReq);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
  Future<Either> logout();
}