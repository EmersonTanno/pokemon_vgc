import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/models/user_model.dart';
import 'package:pokemon_vgc/app/service/user_service.dart';

class RegisterUserController {
  Future<void> registerUser(String username, String email, String password, BuildContext context) async {

    UserService userService = UserService();
    bool validUser = true;
    int id = 0;

    var existingUsers = await userService.getAll();

    for(UserModel user in existingUsers){
      if(username == user.name || email == user.email){
        validUser = false;
      }
      id = user.id;
    }

    if(username == '' || email == '' || password == ''){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Informe Usuário, Senha e e-mail')),
      );
    }else{
      if(validUser == false){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuário ou Email já cadastrados')),
        );
      }else {
        
        userService.createUser(id+1, username, email, password);
        Navigator.of(context).pushReplacementNamed('/home', arguments: id+1);
      }
    }
  }

  void toLoginPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/');
  }
}
