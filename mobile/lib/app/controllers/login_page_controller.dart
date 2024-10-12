import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/service/user_service.dart';
import 'package:pokemon_vgc/main.dart';

class LoginPageController {
  Future<void> login(
      String username, String password, BuildContext context) async {
    UserService userService = UserService();

  print(username);

    var user = await userService.getUserByName(username);

    if(user?.name == username && user?.password == password){
      //jsonSave.saveJsonToLocalStorage((user?.id).toString(), 'logged_user');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sucesso')),
      );
      //Navigator.of(context).pushReplacementNamed('/home');
      loggedUser = user!.id;
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

