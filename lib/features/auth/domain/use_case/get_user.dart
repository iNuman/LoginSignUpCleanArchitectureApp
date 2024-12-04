import 'package:dartz/dartz.dart';
import 'package:flutter_clean_sample/features/auth/core/usecase/usecase.dart';
import 'package:flutter_clean_sample/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_clean_sample/features/auth/di/service_locator.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {

  @override
  Future<Either> call({dynamic param}) async {
    return sl<AuthRepository>().getUser();
  }
  
}