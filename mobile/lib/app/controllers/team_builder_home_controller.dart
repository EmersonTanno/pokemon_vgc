import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/components/team_builder_home/pokemon_edit_box.dart';
import 'package:pokemon_vgc/app/components/team_builder_home/pokemon_info_box.dart';
import 'package:pokemon_vgc/app/models/pokemon_model.dart';
import 'package:pokemon_vgc/app/models/pokemon_team_model.dart';
import 'package:pokemon_vgc/app/service/pokemon_teams_service.dart';

class TeamBuilderHomeController {

  void openPokemonDetails(BuildContext context, PokemonModel pokemon, int teamId) {
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
                editPokemon(context, pokemon, teamId);
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

 void editPokemon(BuildContext context, PokemonModel pokemon, int teamId) {
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
              Navigator.of(context).pop();
              openPokemonDetails(context, pokemon, teamId);
            },
            child: Text(
              'Voltar',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if(changedPokemon.name != '-'){
              PokemonTeamsService pokemonTeamsService = PokemonTeamsService();
              PokemonTeamModel team = await pokemonTeamsService.getTeamById(teamId);
              if(team.pokemon1.name == pokemon.name){
                team.pokemon1 = changedPokemon;
              }else if(team.pokemon2.name == pokemon.name){
                team.pokemon2 = changedPokemon;
              }else if(team.pokemon3.name == pokemon.name){
                team.pokemon3 = changedPokemon;
              }else if(team.pokemon4.name == pokemon.name){
                team.pokemon4 = changedPokemon;
              }else if(team.pokemon5.name == pokemon.name){
                team.pokemon5 = changedPokemon;
              }else if(team.pokemon6.name == pokemon.name){
                team.pokemon6 = changedPokemon;
              }
              pokemonTeamsService.editTeam(teamId, team);
              Navigator.of(context).pushReplacementNamed('/pokemonTeam', arguments: team);
              }else{
                Navigator.pop(context);
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


  void deleteDialog(
      BuildContext context, String teamName, int teamId) {
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
                PokemonTeamsService pokemonTeamsService = PokemonTeamsService();
                PokemonTeamModel team = await pokemonTeamsService.getTeamById(teamId);
                int userId = team.user_id.toInt();
                pokemonTeamsService.deleteTeam(teamId);
                Navigator.of(context).pushReplacementNamed('/home', arguments: userId);
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
