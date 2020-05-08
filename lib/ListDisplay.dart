import 'package:flutter/material.dart';
import 'package:flutterapp/TodoListJson.dart';

class ListDisplay extends StatelessWidget {
  var listSize;
  var todoData;

  ListDisplay(List<TodoJson> data) {
    todoData = data;
    listSize = data.length;
  }

  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
           body: new ListView.builder(
          itemCount: listSize,
          itemBuilder: (ctx, int index) {
            return Card(
                child: ListTile(
                  title: Text(todoData[index].title),
                ));
          },
        ));
  }
}
