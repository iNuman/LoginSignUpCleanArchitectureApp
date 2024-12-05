import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_sample/features/auth/data/mapper/mapper.dart';

import '../../di/service_locator.dart';
import '../dto/signin_req_params.dart';
import '../../domain/models/user.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_sources/local/auth_local_service.dart';
import '../data_sources/remote/auth_api_service.dart';
import '../dto/signup_req_params.dart';

class AuthRepositoryImpl extends AuthRepository {

  
  @override
  Future<Either> signup(SignupReqParams signupReq) async {
   Either result = await sl<AuthApiService>().signup(signupReq);
   AuthLocalService authLocalService = sl<AuthLocalService>();
   return result.fold(
    (error){
      return Left(error);
    }, 
    (data) async {
      Response response = data;

      UserModel userModel = toUserModelFromSignUpOrSignInMap(response.data);
      await authLocalService.saveUserToLocal(userModel.toEntity());
      return Right(response);
    }
    );
  }
  
  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    AuthLocalService authLocalService = sl<AuthLocalService>();
    bool isLoggedInUserAlready = await authLocalService.isLoggedIn();

    if (isLoggedInUserAlready) {
      UserModel? userModel = await authLocalService.getUserFromLocal();
      if (userModel != null) {
        return Right(userModel);
      }
    }

    Either result = await sl<AuthApiService>().getUser();
    return result.fold(
          (error) => Left(error),
          (data) async {
        Response response = data;
        var userModel = toUserModelFromMap(response.data);

        var userModelSaved =  await authLocalService.saveUserToLocal(userModel.toEntity());
        return Right(userModel);
      },
    );
  }

  @override
  Future<Either> logout() async {
    return await sl<AuthLocalService>().logout();
  }

  @override
  Future<Either> signin(SigninReqParams signinReq) async {
    Either result = await sl<AuthApiService>().signin(signinReq);
    AuthLocalService authLocalService = sl<AuthLocalService>();

    return result.fold(
          (error) {
        return Left(error);
      },
          (data) async {
        Response response = data;

        var userModel = toUserModelFromSignUpOrSignInMap(response.data);
        var userEntity = userModel.toEntity();

        // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        // sharedPreferences.setString('token', userEntity.token!);
        await authLocalService.saveUserToLocal(userEntity);
        return Right(userEntity);
      },
    );
  }

}