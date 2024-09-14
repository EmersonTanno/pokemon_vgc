import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/controllers/json_user_controller.dart';

class HomePageController {
  Future<List<dynamic>> loadTeams(int userId) async {
    JsonSave jsonSave = JsonSave();
    List<dynamic> teams = []; // Inicializa a lista de times

    Map<String, dynamic> jsonFileContent = await jsonSave.readJsonFromLocalStorage('users_data');
    List<dynamic> usersList = jsonFileContent['users'] ?? []; // Obtém a lista de usuários

    for (var user in usersList) {
      if (user['id'] == userId) {
        teams = user['teams'] ?? [];
        break; // Encerra o loop após encontrar o usuário
      }
    }

    return teams; // Retorna a lista de times
  }
}
