
import 'package:flutter/cupertino.dart';
@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginSucess extends LoginState {}
class LoginLoading extends LoginState {}
class LoginFailure extends LoginState {
  String errorMessage;
  LoginFailure(this.errorMessage);
}

