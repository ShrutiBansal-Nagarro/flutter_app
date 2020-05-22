import 'dart:async';

import 'package:TestAppFlutter/bloc/bloc_provider.dart';
import 'package:TestAppFlutter/custom/ShimmerCustom.dart';
import 'package:TestAppFlutter/model/TodoItemModel.dart';
import 'package:TestAppFlutter/widgets/todo_ist_item.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
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
    final bloc = BlocProvider.of(ctx).bloc;
    bloc.fetchData();
    return _isInternetConnected
        ? StreamBuilder<List<TodoItemModel>>(
            stream: bloc.todoStream,
            builder: (context, AsyncSnapshot<List<TodoItemModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ShimmerList();
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, i) => TodoListItem(snapshot.data[i]),
                );
              }
              return Center(
                child: Text("An error occured"),
              );
            })
        : Center(
            child: Text("Please check your internet connection."
                "and retry again."),
          );
  }
}
