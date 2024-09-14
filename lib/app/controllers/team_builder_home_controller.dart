import 'package:pokemon_vgc/app/controllers/json_user_controller.dart';
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


}
