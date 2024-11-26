
import 'package:flutter_clean_sample/features/auth/data/data_sources/local/entity/user.dart';

abstract class UserDisplayState {}

class UserLoading extends UserDisplayState {}

class UserLoaded extends UserDisplayState {
  final UserEntity userEntity;
  UserLoaded({required this.userEntity});
}

class LoadUserFailure extends UserDisplayState {
  final String errorMessage;
  LoadUserFailure({required this.errorMessage});
}