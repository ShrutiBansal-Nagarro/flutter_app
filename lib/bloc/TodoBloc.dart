import 'dart:async';

import 'package:TestAppFlutter/bloc/Bloc.dart';
import 'package:TestAppFlutter/model/todo_list_item_model.dart';
import 'package:TestAppFlutter/model/todo_list_json.dart';

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
