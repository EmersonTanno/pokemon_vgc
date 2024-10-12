import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_vgc/app/models/user_model.dart';

class UserService {

  final String url = 'http://localhost:3000/users';

  Future<List<UserModel>> getUsers() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      List<UserModel> users = jsonList.map((json) => UserModel.fromJson(json)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<UserModel> getUserById(int id) async {
    var response = await http.get(Uri.parse('$url/$id'));

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);

      UserModel user = UserModel.fromJson(json);
      return user;
    } else {
      throw Exception('Failed to load user ${response.statusCode}');
    }
  }

  Future<UserModel?> getUserByName(String name) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> usersJson = json.decode(response.body);

      for (var userJson in usersJson) {
        UserModel user = UserModel.fromJson(userJson);
        if (user.name == name) {
          return user;
        }
      }
      return null; 
    } else {
      throw Exception('Falha ao carregar usuários');
    }
  }

  Future<void> createUser(int id, String name, String email, String password) async{
    var response = await http.post(Uri.parse(url),
      body: jsonEncode({"id": id.toString(), "name": name, "email": email, "password": password}));
    if (response.statusCode == 201){
      print('User created successfully');
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<void> deleteUser(int id) async{
    var response = await http.delete(Uri.parse('$url/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if(response.statusCode ==200) {
      print('User deleted successfully');
    } else {
      throw Exception('Failed to delete user ${response.statusCode}');
    }
  }

  Future<void> updateUser(int id, {String? name, String? email, String? password}) async {
    UserModel existingUser = await getUserById(id); 

    Map<String, dynamic> updatedFields = {
      'name': name ?? existingUser.name,
      'email': email ?? existingUser.email,
      'password': password ?? existingUser.password,
    };

    var response = await http.put(
      Uri.parse('$url/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(updatedFields),
    );

    if (response.statusCode == 200) {
      print('User updated successfully');
    } else {
      throw Exception('Failed to update user ${response.statusCode}');
    }
  }


}