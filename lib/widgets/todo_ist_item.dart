import 'file:///E:/AndroidSetup/StudioWorkspace/flutter_app/lib/model/TodoListJson.dart';
import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  final TodoItem todo;

  TodoListItem(this.todo);

  @override
  Widget build(BuildContext context) {
    return  Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 5,
          ),
          child: ListTile(
            title: Text(todo.title),
            subtitle: Text("${todo.completed}"),
          ),
        );
  }
}
