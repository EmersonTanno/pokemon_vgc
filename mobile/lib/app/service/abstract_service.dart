import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class AbstractService<T> {
  final url = 'http://localhost:3000';

  T fromJson(Map<String, dynamic> json);

  Future<List<T>> getAll() async {
    var response = await http.get(Uri.parse('$url'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      List<T> items = jsonList.map((json) => fromJson(json)).toList();
      return items;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
