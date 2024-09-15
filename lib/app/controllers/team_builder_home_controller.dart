import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/components/team_builder_home/pokemon_edit_box.dart';
import 'package:pokemon_vgc/app/components/team_builder_home/pokemon_info_box.dart';
import 'package:pokemon_vgc/app/controllers/json_user_controller.dart';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';
import 'package:pokemon_vgc/app/models/pokemon_team_model.dart';

class TeamBuilderHomeController {
  Future<PokemonTeamModel?> loadTeam(int userId, int teamId) async {
    JsonSave jsonSave = JsonSave();
    PokemonTeamModel? pokemonTeam;

    Map<String, dynamic> jsonFileContent =
        await jsonSave.readJsonFromLocalStorage('users_data');

    List<dynamic> usersList = jsonFileContent['users'] ?? [];

    for (var user in usersList) {
      if (user['id'] == userId) {
        List<dynamic> teams = user['teams'] ?? [];

        for (var team in teams) {
          if (team['team_id'] == teamId) {
            pokemonTeam = PokemonTeamModel.fromJson(team);
            break;
          }
        }
        break;
      }
    }

    return pokemonTeam;
  }

  Future<PokemonTeamModel?> loadTeamUpdate(int userId, int teamId) async {
    JsonSave jsonSave = JsonSave();
    Map<String, dynamic> jsonFileContent =
        await jsonSave.readJsonFromLocalStorage('users_data');
    List<dynamic> usersList = jsonFileContent['users'] ?? [];

    for (var user in usersList) {
      if (user['id'] == userId) {
        List<dynamic> teams = user['teams'] ?? [];
        for (var team in teams) {
          if (team['team_id'] == teamId) {
            return PokemonTeamModel.fromJson(team);
          }
        }
      }
    }
    return null;
  }

  void openPokemonDetails(BuildContext context, PokemonModel pokemon) {
    double screenWidth = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 215, 214, 216),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            pokemon.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          content: PokemonInfoBox(pokemon: pokemon, screenWidth: screenWidth),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Voltar',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                this.editPokemon(context, pokemon);
              },
              child: Text(
                'Editar',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

 void editPokemon(BuildContext context, PokemonModel pokemon) {
  final JsonSave jsonSave = JsonSave();
  double screenWidth = MediaQuery.of(context).size.width;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 71, 70, 71),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          pokemon.name,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        content: PokemonEditBox(pokemon: pokemon, screenWidth: screenWidth),
        actions: [
          TextButton(
            onPressed: () {
              String placeHolder = '';
              jsonSave.saveJsonToLocalStorage(placeHolder, 'updated_pokemon');
              Navigator.of(context).pop();
              openPokemonDetails(context, pokemon);
            },
            child: Text(
              'Voltar',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // Carregar o time atual do localStorage
              int userId = int.parse(jsonSave.returnJsonId('logged_user'));
              int teamId = int.parse(jsonSave.returnJsonId('team_data'));
              String updatedPokemon = jsonSave.returnJsonId('updated_pokemon');

              // Verificar se updatedPokemon é null ou vazio
              if (updatedPokemon == '' || updatedPokemon.isEmpty) {
                print("Erro: Nenhum Pokémon atualizado encontrado.");
                Navigator.of(context).pop(); // Fecha o diálogo e sai
                return;
              }

              Map<String, dynamic> pokemonData = jsonDecode(updatedPokemon);
              PokemonModel pokemon2 = PokemonModel.fromJson(pokemonData);
              int count = 0;
              int pokemon_local = 0;

              PokemonTeamModel? teamDataModel =
                  await loadTeamUpdate(userId, teamId);

              if (teamDataModel != null) {
                List<PokemonModel> pokemonList = [
                  teamDataModel.pokemon1,
                  teamDataModel.pokemon2,
                  teamDataModel.pokemon3,
                  teamDataModel.pokemon4,
                  teamDataModel.pokemon5,
                  teamDataModel.pokemon6,
                ];

                // Atualizar o Pokémon na lista do time
                for (var i = 0; i < pokemonList.length; i++) {
                  count++;
                  if (pokemonList[i].name == pokemon.name) {
                    pokemonList[i] = pokemon2;
                    pokemon_local = count;
                    break;
                  }
                }

                await jsonSave.savePokemonInUserData(
                    pokemon2, userId - 1, teamId - 1, pokemon_local);
                //limpa o updated_pokemon
                String placeHolder = '';
                jsonSave.saveJsonToLocalStorage(placeHolder, 'updated_pokemon');
                Navigator.of(context).pushReplacementNamed('/pokemonTeam');
              } else {
                print("Erro: O time não foi encontrado.");
                Navigator.of(context).pop();
              }
            },
            child: Text(
              'Salvar',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      );
    },
  );
}

  Future<void> deleteTeam(BuildContext context, int userId, int teamId) async {
    JsonSave jsonSave = JsonSave();
    Map<String, dynamic> userData =
        await jsonSave.readJsonFromLocalStorage('users_data');

    List<dynamic> teams = userData['users'][userId - 1]['teams'];

    if (teamId <= teams.length) {
      teams.removeAt(teamId - 1);

      userData['users'][userId - 1]['teams'] = teams;

      await jsonSave.saveJsonToLocalStorage(jsonEncode(userData), 'users_data');
      Navigator.of(context).pushReplacementNamed('/home');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Time removido com sucesso!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: Time não encontrado.')),
      );
    }
  }

  void deleteDialog(
      BuildContext context, String teamName, int userId, int teamId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 175, 167, 175),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Deletar $teamName?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Voltar',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () async {
                deleteTeam(context, userId, teamId);
              },
              child: Text(
                'Deletar',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
