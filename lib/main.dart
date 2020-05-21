import 'package:TestAppFlutter/TodoListJson.dart';
import 'package:TestAppFlutter/todo_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: TodoModel(),
          ),
        ],
        child: MaterialApp(
          title: 'Todo App',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: Scaffold(
              appBar: AppBar(
                title: Text('Todo App'),
              ),
              body: ToDoListScreen()),
        ));
  }
}
