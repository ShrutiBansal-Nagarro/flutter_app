import 'dart:async';

import 'file:///E:/AndroidSetup/StudioWorkspace/flutter_app/lib/model/TodoListJson.dart';
import 'file:///E:/AndroidSetup/StudioWorkspace/flutter_app/lib/widgets/todo_ist_item.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../custom/ShimmerCustom.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  bool _isInternetConnected = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        setState(() {
          _isInternetConnected = true;
        });
        break;
      case ConnectivityResult.none:
        setState(() {
          _isInternetConnected = false;
        });
        break;
      default:
        setState(() {
          _isInternetConnected = false;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext ctx) {
    return Container(
      child: _isInternetConnected
          ? FutureBuilder(
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
                        itemBuilder: (ctx, i) => TodoListItem(todoData.todo[i]),
                      ),
                    );
                  }
                }
              },
            )
          : Center(
              child: Text("No internet connection"),
            ),
    );
  }
}
