import 'package:TestAppFlutter/TodoListJson.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ShimmerCustom.dart';

class ToDoListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext ctx) {
    return Container(
      child: FutureBuilder(
        future: Provider.of<TodoModel>(ctx, listen: false).fetchTodo(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return ShimmerList();
          } else {
            if (dataSnapshot.error != null) {
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Consumer<TodoModel>(
                builder: (ctx, todoData, child) => ListView.builder(
                  itemCount: todoData.todo.length,
                  itemBuilder: (ctx, i) => ListTile(
                    title: Text(todoData.todo[i].title),
                    subtitle: Text("${todoData.todo[i].completed}"),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
}
}
