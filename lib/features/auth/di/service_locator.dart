
import 'package:get_it/get_it.dart';

import '../data/data_sources/local/auth_local_service.dart';
import '../data/data_sources/remote/auth_api_service.dart';
import '../data/data_sources/remote/dio_client.dart';
import '../data/repository_impl/auth_repository.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/use_case/get_user.dart';
import '../domain/use_case/is_logged_in.dart';
import '../domain/use_case/logout.dart';
import '../domain/use_case/signin.dart';
import '../domain/use_case/signup.dart';

final sl = GetIt.instance;

void setupServiceLocator() {

  sl.registerSingleton<DioClient>(DioClient());
  
  // Services
  sl.registerSingleton<AuthApiService>(
    AuthApiServiceImpl()
  );

  sl.registerSingleton<AuthLocalService>(
    AuthLocalServiceImpl()
  );

  // Repositories
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  // Usecases
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

  sl.registerSingleton<IsLoggedInUseCase>(
    IsLoggedInUseCase()
  );

  sl.registerSingleton<GetUserUseCase>(
    GetUserUseCase()
  );

  sl.registerSingleton<LogoutUseCase>(
    LogoutUseCase()
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
  );
}