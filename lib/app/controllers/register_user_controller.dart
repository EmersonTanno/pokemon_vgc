import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/controllers/json_user_controller.dart';
import 'package:pokemon_vgc/app/models/user_model.dart';

class RegisterUserController {
  JsonSave jsonSave = JsonSave();

  Future<void> registerUser(String username, String email, String password, BuildContext context) async {

    UserModel user = UserModel(
      id: 0, 
      name: username,
      email: email,
      password: password,
    );

    await jsonSave.addUserToLocalStorage(user, 'users_data');

    printUsers();
    Navigator.of(context).pushReplacementNamed('/home');
  }

  void printUsers() {
    jsonSave.printLocalStorage('users_data');
  }

  void toLoginPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/');
  }
}
