import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/controllers/json_user_controller.dart';

class LoginPageController {

 Future<void> login(String username, String password, BuildContext context) async {
    JsonSave jsonSave = JsonSave();

    Map<String, dynamic> jsonFileContent = await jsonSave.readJsonFromLocalStorage('users_data');

    List<dynamic> usersList = jsonFileContent['users'] ?? [];

    bool userFound = false;
    for (var user in usersList) {
      if (user['name'] == username && user['password'] == password) {
        userFound = true;
        Navigator.of(context).pushReplacementNamed('/home');
        break;
      }
    }

    if (!userFound) {
      print('Login negado: username ou senha incorretos.');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Username ou senha incorretos')),
      );
    }
 }

  void register(BuildContext context){
    Navigator.of(context).pushReplacementNamed('/register');
  }
}
