import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/controllers/json_user_controller.dart';
import 'package:pokemon_vgc/app/models/user_model.dart';
import 'package:pokemon_vgc/app/service/user_service.dart';

class RegisterUserController {
  JsonSave jsonSave = JsonSave();

  Future<void> registerUser(String username, String email, String password, BuildContext context) async {

    UserService userService = UserService();
    bool validUser = true;
    int _id = 0;

    var existingUsers = await userService.getUsers();

    for(UserModel user in existingUsers){
      if(username == user.name || email == user.email){
        validUser = false;
      }
      _id = user.id;
    }

    if(validUser == false){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário ou Email já cadastrados')),
      );
    }else {
      userService.createUser(_id+1, username, email, password);
    }
  }

  void printUsers() {
    jsonSave.printLocalStorage('users_data');
  }

  void toLoginPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/');
  }
}
