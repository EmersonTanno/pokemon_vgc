import 'package:flutter/material.dart';

class LoginPageController {
  void login(String email, String password, BuildContext context) {
    if (email == 'kannon@gmail.com' && password == '123') {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      print('Negado');
    }
  }


  void register(BuildContext context){
    Navigator.of(context).pushReplacementNamed('/register');
  }
}
