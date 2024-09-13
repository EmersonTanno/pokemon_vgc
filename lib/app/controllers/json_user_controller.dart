import 'dart:convert';
import 'dart:html';

import 'package:pokemon_vgc/app/models/user_model.dart';  // Biblioteca do navegador

class JsonSave {
  Future<void> saveJsonToLocalStorage(String jsonData, String key) async {
    window.localStorage[key] = jsonData;
    print('Dados salvos no localStorage com chave: $key');
  }

  Future<Map<String, dynamic>> readJsonFromLocalStorage(String key) async {
    String? jsonData = window.localStorage[key];
    if (jsonData != null) {
      return jsonDecode(jsonData);
    } else {
      return {"users": []};
    }
  }

  Future<void> addUserToLocalStorage(UserModel user, String key) async {

    Map<String, dynamic> jsonFileContent = await readJsonFromLocalStorage(key);

    List<dynamic> usersList = jsonFileContent['users'] ?? [];

    int newId = 1;
    if (usersList.isNotEmpty) {
      newId = usersList.map((user) => user['id']).reduce((a, b) => a > b ? a : b) + 1;
    }

    user = UserModel(
      id: newId,
      name: user.name,
      email: user.email,
      password: user.password,
    );

    usersList.add(user.toJson());

    jsonFileContent['users'] = usersList;

    String updatedJsonData = jsonEncode(jsonFileContent);
    await saveJsonToLocalStorage(updatedJsonData, key);
  }

  // Função para imprimir o conteúdo do localStorage
  void printLocalStorage(String key) {
    String? jsonData = window.localStorage[key];
    if (jsonData != null) {
      print("Conteúdo do localStorage para a chave '$key': $jsonData");
    } else {
      print("Nenhum dado encontrado para a chave '$key'.");
    }
  }
}
