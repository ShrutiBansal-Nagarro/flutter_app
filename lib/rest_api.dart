//import 'dart:convert';
//
//import 'package:TestAppFlutter/TodoListJson.dart';
//import 'package:http/http.dart';
//
//class URLS {
//  static const String BASE_URL = 'https://jsonplaceholder.typicode.com/todos';
//}
//
//class ApiService {
//  List<TodoJson> list;
//
//  Future<List<TodoJson>> fetchTodo() async {
//    final response = await get(URLS.BASE_URL);
//    if (response.statusCode == 200) {
//      final jsonData = json.decode(response.body);
//      return new List<TodoJson>.from(jsonData.map((x) => TodoJson.fromJson(x)));
//    } else {
//      throw Exception('Failed to load album');
//    }
//  }
//}
