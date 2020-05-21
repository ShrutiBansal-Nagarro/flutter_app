import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class TodoItem with ChangeNotifier {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoItem({this.userId, this.id, this.title, this.completed});
}

class TodoModel with ChangeNotifier {
  List<TodoItem> _todoItem = [];

  List<TodoItem> get todo {
    return [..._todoItem];
  }

  Future<void> fetchTodo() async {
    final response = await get('https://jsonplaceholder.typicode.com/todos');
    final jsonData = json.decode(response.body);
    _todoItem
        .addAll(new List<TodoItem>.from(jsonData.map((json) => new TodoItem(
              userId: json['userId'],
              id: json['id'],
              title: json['title'],
              completed: json['completed'],
            ))));
    notifyListeners();
  }

//  factory TodoJson.fromJson(Map<String, dynamic> json) => new TodoJson(
//        userId: json['userId'],
//        id: json['id'],
//        title: json['title'],
//        completed: json['completed'],
//      );

//  Map<String, dynamic> toJson() => {
//        "userId": userId,
//        "id": id,
//        "title": title,
//        "completed": completed,
//      };
}
