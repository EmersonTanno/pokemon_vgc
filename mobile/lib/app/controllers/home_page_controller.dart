import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/controllers/json_user_controller.dart';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';
import 'package:pokemon_vgc/app/models/pokemon_team_model.dart';
import 'package:pokemon_vgc/app/models/user_model.dart';
import 'package:pokemon_vgc/app/service/pokemon_teams_service.dart';
import 'package:pokemon_vgc/app/service/user_service.dart';
import 'package:pokemon_vgc/main.dart';

class HomePageController {
  Future<List<PokemonTeamModel>> loadTeams(int userId) async {
    PokemonTeamsService pokemonTeamsService = PokemonTeamsService();
    List<PokemonTeamModel> teams = await pokemonTeamsService.getTeamsByUserId(loggedUser);

    return teams;
  }

  Future<UserModel> getUserInfo(int userId) async {
    UserService userService = UserService();
    late UserModel user;

    user = await userService.getUserById(loggedUser);

    return user;
  }

  void selectTeam(BuildContext context, int team_id) {
    //JsonSave jsonSave = JsonSave();

    selectedTeam = team_id;
    print(selectedTeam);
    //jsonSave.saveJsonToLocalStorage(team_id.toString(), 'team_data');
    //Navigator.of(context).pushReplacementNamed('/pokemonTeam');
  }

  void createTeamAlert(BuildContext context) {
    TextEditingController teamNameController = TextEditingController();
    PokemonTeamsService pokemonTeamsService = PokemonTeamsService();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 215, 214, 216),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Informe o Nome do Time',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width / 2,
            child: TextFormField(
              controller: teamNameController,
              decoration: InputDecoration(
                labelText: 'Nome do Time',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                String teamName = teamNameController.text;
                if (teamName.isNotEmpty) {
                  pokemonTeamsService.createTeam(teamName);
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Time criado com sucesso!')),
                );
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }


}
