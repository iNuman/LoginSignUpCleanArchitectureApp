
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_sample/features/auth/common/bloc/auth/auth_state.dart';
import 'package:flutter_clean_sample/features/auth/di/service_locator.dart';
import 'package:flutter_clean_sample/features/auth/domain/use_case/is_logged_in.dart';

class AuthStateCubit extends Cubit<AuthState> {

  AuthStateCubit() : super(AppInitialState());
  
  void appStarted() async {
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }

}