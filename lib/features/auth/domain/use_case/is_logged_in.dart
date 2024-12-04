
import 'package:flutter_clean_sample/features/auth/core/usecase/usecase.dart';
import 'package:flutter_clean_sample/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_clean_sample/features/auth/di/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {

  @override
  Future<bool> call({dynamic param}) async {
    return sl<AuthRepository>().isLoggedIn();
  }
}