import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_sample/features/auth/di/service_locator.dart';
import 'package:flutter_clean_sample/features/auth/domain/use_case/get_user.dart';
import 'package:flutter_clean_sample/features/auth/presentation/home/bloc/user_display_state.dart';

class UserDisplayCubit extends Cubit<UserDisplayState> {

  UserDisplayCubit() : super (UserLoading());

  void displayUser() async {
    var result = await sl < GetUserUseCase > ().call();
    result.fold(
      (error) {
        emit(LoadUserFailure(errorMessage: error));
      },
      (data) {
        emit(UserLoaded(userEntity: data));
      }
    );
  }
}