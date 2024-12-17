
import 'package:flutter_clean_sample/features/auth/domain/models/user.dart';

abstract class UserDisplayState {}

class UserLoading extends UserDisplayState {}

class UserLoaded extends UserDisplayState {
  final UserModel userModel;
  UserLoaded({required this.userModel});
}

class LoadUserFailure extends UserDisplayState {
  final String errorMessage;
  LoadUserFailure({required this.errorMessage});
}