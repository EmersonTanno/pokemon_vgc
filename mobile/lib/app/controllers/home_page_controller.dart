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
    JsonSave jsonSave = JsonSave();

    jsonSave.saveJsonToLocalStorage(team_id.toString(), 'team_data');
    Navigator.of(context).pushReplacementNamed('/pokemonTeam');
  }

  void createTeamAlert(BuildContext context) {
    TextEditingController teamNameController = TextEditingController();

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
                  createEmptyTeam(context, teamName);
                }
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> createEmptyTeam(BuildContext context, String teamName) async {
    final JsonSave jsonSave = JsonSave();
    int userId = int.parse(jsonSave.returnJsonId('logged_user'));

    Map<String, dynamic> userData =
        await jsonSave.readJsonFromLocalStorage('users_data');

    List<dynamic> teams = userData['users'][userId - 1]['teams'];

    int newTeamId = teams.length + 1;
    int teamUserId = userId;

    // Criar um novo time vazio
    PokemonTeamModel newTeam = PokemonTeamModel(
      newTeamId,
      teamUserId,
      teamName,
      PokemonModel(
          name: '',
          lvl: 0,
          nature: '',
          ability: '',
          hp: 0,
          atk: 0,
          def: 0,
          spa: 0,
          spd: 0,
          spe: 0,
          image: '',
          move1: '',
          move2: '',
          move3: '',
          move4: ''),
      PokemonModel(
          name: '',
          lvl: 0,
          nature: '',
          ability: '',
          hp: 0,
          atk: 0,
          def: 0,
          spa: 0,
          spd: 0,
          spe: 0,
          image: '',
          move1: '',
          move2: '',
          move3: '',
          move4: ''),
      PokemonModel(
          name: '',
          lvl: 0,
          nature: '',
          ability: '',
          hp: 0,
          atk: 0,
          def: 0,
          spa: 0,
          spd: 0,
          spe: 0,
          image: '',
          move1: '',
          move2: '',
          move3: '',
          move4: ''),
      PokemonModel(
          name: '',
          lvl: 0,
          nature: '',
          ability: '',
          hp: 0,
          atk: 0,
          def: 0,
          spa: 0,
          spd: 0,
          spe: 0,
          image: '',
          move1: '',
          move2: '',
          move3: '',
          move4: ''),
      PokemonModel(
          name: '',
          lvl: 0,
          nature: '',
          ability: '',
          hp: 0,
          atk: 0,
          def: 0,
          spa: 0,
          spd: 0,
          spe: 0,
          image: '',
          move1: '',
          move2: '',
          move3: '',
          move4: ''),
      PokemonModel(
          name: '',
          lvl: 0,
          nature: '',
          ability: '',
          hp: 0,
          atk: 0,
          def: 0,
          spa: 0,
          spd: 0,
          spe: 0,
          image: '',
          move1: '',
          move2: '',
          move3: '',
          move4: ''),
    );

    // Adicionar o novo time à lista de times do usuário
    teams.add(newTeam.toJson());

    // Salvar os dados atualizados de volta no localStorage
    await jsonSave.saveJsonToLocalStorage(jsonEncode(userData), 'users_data');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Time criado com sucesso!')),
    );

    selectTeam(context, newTeamId);
  }
}
