import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokemon_vgc/app/models/pokemon_team_model.dart';

class PokemonTeamsService{
  final String url = 'http://localhost:3000/teams';


  Future<List<PokemonTeamModel>> getTeams() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      List<PokemonTeamModel> teams = jsonList.map((json) => PokemonTeamModel.fromJson(json)).toList();
      return teams;
    } else {
      throw Exception('Failed to load teams ${response.statusCode}');
    }
  }


  Future<List<PokemonTeamModel>> getTeamsByUserId(int userId) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> existingTeams = json.decode(response.body);
      List<PokemonTeamModel> usersTeams = [];

      for (var team in existingTeams) {
        if (team['user_id'] == userId) {
          usersTeams.add(PokemonTeamModel.fromJson(team));
        }
      }

      return usersTeams;
    } else {
      throw Exception('Falha ao carregar times');
    }
  }

  
}