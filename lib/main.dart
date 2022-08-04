import 'package:flutter/material.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/model/db_model.dart';
import 'package:todolist/screens/Homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Homepage();
  }
}
