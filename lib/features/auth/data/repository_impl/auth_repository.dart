import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_sample/features/auth/data/data_sources/local/entity/user.dart';
import 'package:flutter_clean_sample/features/auth/data/mapper/mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
   return result.fold(
    (error){
      return Left(error);
    }, 
    (data) async {
      Response response = data;

      UserModel userModel = toUserModelFromSignUpOrSignInMap(response.data);
      var userEntity = userModel.toEntity();
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token', userEntity.token!);
      // sharedPreferences.setString('token', response.data['token']);
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
    Either result = await sl<AuthApiService>().getUser();
    return result.fold(
      (error){
        return Left(error);
      },
      (data) {
        Response response = data;
        var userModel = toUserModelFromMap(response.data);
        var userEntity = userModel.toEntity();
        print("ffnet getUser $userEntity");
        return Right(userEntity);
      }
     );
  }
  
  @override
  Future<Either> logout() async {
    return await sl<AuthLocalService>().logout();
  }

  @override
  Future<Either> signin(SigninReqParams signinReq) async {
    Either result = await sl < AuthApiService > ().signin(signinReq);
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        Response response = data;

        var userModel = toUserModelFromSignUpOrSignInMap(response.data);
        var userEntity = userModel.toEntity();

        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', userEntity.token!);
        // sharedPreferences.setString('token', response.data['token']);
        return Right(response);
      }
    );
  }

}