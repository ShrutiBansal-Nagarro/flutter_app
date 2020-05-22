import 'package:TestAppFlutter/model/todo_list_item_model.dart';
import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  final TodoItemModel todo;

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
