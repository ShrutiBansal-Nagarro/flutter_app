import 'dart:convert';

import 'package:flutterapp/TodoListJson.dart';
import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'https://jsonplaceholder.typicode.com/todos';
}

class ApiService {
  List<TodoJson> list;

  Future<List<TodoJson>> fetchTodo() async {
    final response = await http.get(URLS.BASE_URL);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return new List<TodoJson>.from(jsonData.map((x) => TodoJson.fromJson(x)));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
