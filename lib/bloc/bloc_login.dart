import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/streams.dart' as rx;
import 'package:shoppy_app/bloc/validator.dart';
import 'package:shoppy_app/screens/main_screen.dart';

class BlocLogin extends Object with Validator implements BaseBloc{

  final context;
  BlocLogin(this.context);
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);
  Stream<bool> get submit => rx.CombineLatestStream.combine2(email, password, (e, p) => true);

  login(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }

}

abstract class BaseBloc{
  void dispose();
}