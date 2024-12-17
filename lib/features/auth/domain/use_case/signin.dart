import 'package:dartz/dartz.dart';
import 'package:flutter_clean_sample/features/auth/core/usecase/usecase.dart';
import 'package:flutter_clean_sample/features/auth/di/service_locator.dart';
import 'package:flutter_clean_sample/features/auth/data/dto/signin_req_params.dart';
import 'package:flutter_clean_sample/features/auth/domain/models/user.dart';
import 'package:flutter_clean_sample/features/auth/domain/repository/auth_repository.dart';

class SigninUseCase implements UseCase<Either, UserModel> {

  @override
  Future<Either> call({UserModel? param}) async {
    return sl<AuthRepository>().signin(param!);
  }
  
}