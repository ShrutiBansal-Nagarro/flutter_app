import 'dart:async';

import 'package:TestAppFlutter/bloc/Bloc.dart';
import 'package:TestAppFlutter/model/TodoItemModel.dart';
import 'package:TestAppFlutter/model/TodoListJson.dart';

class TodoBloc implements Bloc {
  final StreamController<List<TodoItemModel>> _controller =
      StreamController<List<TodoItemModel>>.broadcast();

  Stream<List<TodoItemModel>> get todoStream => _controller.stream;

  void fetchData() async {
    TodoModel model = TodoModel();
    await model.fetchTodo();
    _controller.sink.add(model.todo);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
