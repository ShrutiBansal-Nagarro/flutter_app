import 'package:TestAppFlutter/bloc/TodoBloc.dart';
import 'package:flutter/material.dart';

class BlocProvider extends InheritedWidget {
  final TodoBloc bloc;
  final Widget child;

  BlocProvider({this.bloc, this.child}) : super(child: child);

  static BlocProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: BlocProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
