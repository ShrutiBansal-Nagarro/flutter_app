import 'package:flutter/material.dart';
import 'package:flutterapp/ListDisplay.dart';
import 'package:flutterapp/ShimmerCustom.dart';
import 'package:flutterapp/TodoListJson.dart';
import 'package:flutterapp/rest_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<TodoJson>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = ApiService().fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<TodoJson>>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListDisplay(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return ShimmerList();
            },
          ),
        ),
      ),
    );
  }

//  isInternetConnected() async {
//    var connectivityResult = await (Connectivity().checkConnectivity());
//    if (connectivityResult == ConnectivityResult.mobile) {
//      return true;
//    } else if (connectivityResult == ConnectivityResult.wifi) {
//      print("Connected to WiFi");
//      return false;
//    } else {
//      print("Unable to connect. Please Check Internet Connection");
//      return false;
//    }
//  }
}
