

import 'package:flutter/material.dart';

@immutable


abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}
class RegisSuccess extends LoginState {}



class LoginFailure extends LoginState {
final String errorMessage;
LoginFailure({required this.errorMessage});
}

class RegisFailure extends LoginState {
 final  String errorMessage;
RegisFailure({required this.errorMessage});
}
