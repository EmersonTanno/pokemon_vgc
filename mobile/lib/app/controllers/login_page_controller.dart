import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/service/user_service.dart';

class LoginPageController {
  Future<void> login(
      String username, String password, BuildContext context) async {
    UserService userService = UserService();

    var user = await userService.getUserByName(username);

    if(user?.name == username && user?.password == password){
      Navigator.of(context).pushReplacementNamed('/home', arguments: user!.id.toInt());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário ou senha incorretos')),
      );
    }
  }

  void register(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/register');
  }
}

