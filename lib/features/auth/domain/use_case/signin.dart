import 'package:dartz/dartz.dart';
import 'package:flutter_clean_sample/features/auth/core/usecase/usecase.dart';
import 'package:flutter_clean_sample/features/auth/di/service_locator.dart';
import 'package:flutter_clean_sample/features/auth/data/dto/signin_req_params.dart';
import 'package:flutter_clean_sample/features/auth/domain/repository/auth_repository.dart';

class SigninUseCase implements UseCase<Either, SigninReqParams> {

  @override
  Future<Either> call({SigninReqParams ? param}) async {
    return sl<AuthRepository>().signin(param!);
  }
  
}