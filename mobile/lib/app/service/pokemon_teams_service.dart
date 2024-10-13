import 'package:http/http.dart' as http;
import 'package:pokemon_vgc/app/models/pokemon_model.dart';
import 'dart:convert';
import 'package:pokemon_vgc/app/models/pokemon_team_model.dart';

class PokemonTeamsService{
  final String url = 'http://localhost:3000/teams';


  Future<List<PokemonTeamModel>> getTeams() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      List<PokemonTeamModel> teams = jsonList
          .map((json) => PokemonTeamModel.fromJson(json))
          .toList();
      return teams;
    } else {
      throw Exception('Failed to load teams');
    }
  }



  Future<List<PokemonTeamModel>> getTeamsByUserId(int userId) async {
    final existingTeams = await getTeams();
    List<PokemonTeamModel> usersTeams = [];

    for (var team in existingTeams) {
      if (team.user_id == userId) {
        usersTeams.add(team);
      }
    }
    return usersTeams;
  }

  Future<PokemonTeamModel> getTeamById(int teamId) async {
    final teams = await getTeams();
    for (var team in teams) {
        if (team.id == teamId) {
          return team;
        }
      }
      throw Exception('Failed to find team');
  }

  Future<int> createTeam(String teamName, int userId) async {
    List<PokemonTeamModel> teams = await getTeams();
    int id = 0;
    for (var team in teams) {
      id = team.id;
    }

    PokemonModel pokemon = PokemonModel(
      name: '-',
      lvl: 0,
      nature: '-',
      ability: '-',
      hp: 0,
      atk: 0,
      def: 0,
      spa: 0,
      spd: 0,
      spe: 0,
      image: '-',
      move1: '-',
      move2: '-',
      move3: '-',
      move4: '-'
    );
    
    var response = await http.post(Uri.parse(url),
      body: jsonEncode({"id": (id+1).toString(), "user_id": userId.toString(), "team_name": teamName, "pokemon1": pokemon, "pokemon2": pokemon, "pokemon3": pokemon, "pokemon4": pokemon, "pokemon5": pokemon, "pokemon6": pokemon}));
    if (response.statusCode == 201){
      return id+1;
    } else {
      throw Exception('Failed to create team');
    }
  }


  Future<void> deleteTeam(int id) async{
    var response = await http.delete(Uri.parse('$url/${id.toString()}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if(response.statusCode ==200) {
      print('Team deleted successfully');
    } else {
      throw Exception('Failed to delete team ${response.statusCode}');
    }
  }

  Future<void> editTeam(int teamId, PokemonTeamModel updatedTeam) async {
    var response = await http.put(
      Uri.parse('$url/$teamId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "id": updatedTeam.id.toString(),
      "user_id": updatedTeam.user_id.toString(),
      "team_name": updatedTeam.team_name,
      "pokemon1": updatedTeam.pokemon1.toJson(),
      "pokemon2": updatedTeam.pokemon2.toJson(),
      "pokemon3": updatedTeam.pokemon3.toJson(),
      "pokemon4": updatedTeam.pokemon4.toJson(),
      "pokemon5": updatedTeam.pokemon5.toJson(),
      "pokemon6": updatedTeam.pokemon6.toJson(),
    }),
  );

  if (response.statusCode == 200) {
    print('Team updated successfully');
  } else {
    throw Exception('Failed to update team ${response.statusCode}');
  }
}

  

  
}