import 'package:dartz/dartz.dart';
import 'package:flutter_clean_sample/features/auth/core/usecase/usecase.dart';
import 'package:flutter_clean_sample/features/auth/di/service_locator.dart';
import 'package:flutter_clean_sample/features/auth/domain/models/signup_req_params.dart';
import 'package:flutter_clean_sample/features/auth/domain/repository/auth.dart';


class SignupUseCase implements UseCase<Either, SignupReqParams> {

  @override
  Future<Either> call({SignupReqParams ? param}) async {
    return sl<AuthRepository>().signup(param!);
  }
  
}