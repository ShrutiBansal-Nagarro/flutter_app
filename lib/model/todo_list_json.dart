import 'dart:convert';

import 'package:TestAppFlutter/model/todo_list_item_model.dart';
import 'package:http/http.dart';

class TodoModel {
  List<TodoItemModel> _todoItem = [];

  List<TodoItemModel> get todo {
    return _todoItem;
  }

  Future<void> fetchTodo() async {
    final response = await get('https://jsonplaceholder.typicode.com/todos');
    final jsonData = json.decode(response.body);
    print("jsonData $jsonData");
    _todoItem
        .addAll(List<TodoItemModel>.from(jsonData.map((json) => TodoItemModel(
              userId: json['userId'],
              id: json['id'],
              title: json['title'],
              completed: json['completed'],
            ))));
  }
}
