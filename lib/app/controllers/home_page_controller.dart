import 'package:pokemon_vgc/app/controllers/json_user_controller.dart';
import 'package:pokemon_vgc/app/models/user_model.dart';

class HomePageController {
  Future<List<dynamic>> loadTeams(int userId) async {
    JsonSave jsonSave = JsonSave();
    List<dynamic> teams = []; // Inicializa a lista de times

    Map<String, dynamic> jsonFileContent =
        await jsonSave.readJsonFromLocalStorage('users_data');
    List<dynamic> usersList =
        jsonFileContent['users'] ?? []; // Obtém a lista de usuários

    for (var user in usersList) {
      if (user['id'] == userId) {
        teams = user['teams'] ?? [];
        break; // Encerra o loop após encontrar o usuário
      }
    }

    return teams; // Retorna a lista de times
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
}
