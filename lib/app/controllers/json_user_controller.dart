import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/models/user_model.dart';

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

  Future<void> saveIfEmpty(
      UserModel user, String key, BuildContext context) async {
    String? jsonData = window.localStorage[key];

    if (jsonData == null || jsonData.isEmpty) {
      print('LocalStorage está vazio. Salvando usuário.');
      await addUserToLocalStorageLoginPage(user, key, context);
    } else {
      print('LocalStorage já contém dados.');
    }
  }

  Future<void> addUserToLocalStorage(
      UserModel user, String key, BuildContext context) async {
    // Carregar os dados existentes no localStorage
    Map<String, dynamic> jsonFileContent = await readJsonFromLocalStorage(key);

    // Recuperar a lista de usuários
    List<dynamic> usersList = jsonFileContent['users'] ?? []; 
    // Verificar se já existe um usuário com o mesmo username ou email
    bool userExists = usersList.any((existingUser) =>
        existingUser['name'] == user.name ||
        existingUser['email'] == user.email);

    if (userExists) {
      print('Login negado: username ou senha incorretos.');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User ou E-mail já existem')),
      );
    } else {
      // Calcular o próximo ID com base no maior ID existente
      int newId = 1;
      if (usersList.isNotEmpty) {
        newId = usersList
                .map((user) => user['id'])
                .reduce((a, b) => a > b ? a : b) +
            1;
      }

      // Atualizar o ID do novo usuário
      user = UserModel(
        id: newId,
        name: user.name,
        email: user.email,
        password: user.password,
      );

       // Adicionar o novo usuário à lista
      usersList.add(user.toJson());

       // Atualizar o conteúdo do arquivo JSON
      jsonFileContent['users'] = usersList;

       // Salvar os dados atualizados no localStorage
      String updatedJsonData = jsonEncode(jsonFileContent);
      await saveJsonToLocalStorage(updatedJsonData, key);

      print('Usuário cadastrado com sucesso.');

      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  Future<void> addUserToLocalStorageLoginPage(
      UserModel user, String key, BuildContext context) async {
    Map<String, dynamic> jsonFileContent = await readJsonFromLocalStorage(key);
    List<dynamic> usersList = jsonFileContent['users'] ?? [];

    int newId = 1;
    if (usersList.isNotEmpty) {
      newId = usersList.map((u) => u['id']).reduce((a, b) => a > b ? a : b) + 1;
    }

    user = UserModel(
      id: newId,
      name: user.name,
      email: user.email,
      password: user.password,
      teams: user.teams,
    );

    usersList.add(user.toJson());
    jsonFileContent['users'] = usersList;

    String updatedJsonData = jsonEncode(jsonFileContent);
    await saveJsonToLocalStorage(updatedJsonData, key);

    print('Usuário cadastrado com sucesso e time salvo.');
  }

  void printLocalStorage(String key) {
    String? jsonData = window.localStorage[key];
    if (jsonData != null) {
      print("Conteúdo do localStorage para a chave '$key': $jsonData");
    } else {
      print("Nenhum dado encontrado para a chave '$key'.");
    }
  }
}
