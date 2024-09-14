import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/controllers/json_user_controller.dart';
import 'package:pokemon_vgc/app/models/pokemon_team_model.dart';
import 'package:pokemon_vgc/app/models/user_model.dart';

class HomePageController {
  Future<List<dynamic>> loadTeams(int userId) async {
    JsonSave jsonSave = JsonSave();
    List<dynamic> teams = []; 

    Map<String, dynamic> jsonFileContent =
        await jsonSave.readJsonFromLocalStorage('users_data');
    List<dynamic> usersList =
        jsonFileContent['users'] ?? []; 

    for (var user in usersList) {
      if (user['id'] == userId) {
        teams = user['teams'] ?? [];
        break; 
      }
    }

    return teams; 
  }

  Future<UserModel> getUserInfo(int userId) async {
    JsonSave jsonSave = JsonSave();
    late UserModel user;

    Map<String, dynamic> jsonFileContent =
        await jsonSave.readJsonFromLocalStorage('users_data');
    List<dynamic> usersList = jsonFileContent['users'] ?? [];

    for (var users in usersList) {
      if (users['id'] == userId) {
        user = UserModel(
            id: users['id'],
            name: users['name'],
            email: users['email'],
            password: users['password']);
        break;
      }
    }

    return user;
  }


  void selectTeam(BuildContext context, int team_id){
    JsonSave jsonSave = JsonSave();

    jsonSave.saveJsonToLocalStorage(team_id.toString(), 'team_data');
    Navigator.of(context).pushReplacementNamed('/pokemonTeam');
  }
}
