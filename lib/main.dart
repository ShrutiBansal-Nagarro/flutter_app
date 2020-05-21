import 'package:TestAppFlutter/bloc/TodoBloc.dart';
import 'package:TestAppFlutter/bloc/bloc_provider.dart';
import 'package:flutter/material.dart';

import 'file:///E:/AndroidSetup/StudioWorkspace/flutter_app/lib/screen/todo_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: TodoBloc(),
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
      ),
    );
  }
}
