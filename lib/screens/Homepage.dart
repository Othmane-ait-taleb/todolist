import 'package:flutter/material.dart';
import 'package:todolist/model/db_model.dart';
import 'package:todolist/widgets/input.dart';
import 'package:todolist/widgets/todo_card.dart';
import 'package:todolist/widgets/todolist.dart';

import '../model/todo.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var db = DatabaseConnect();
  //funtion to add todo to database
  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  /// fun to delet item
  void deleteItem(Todo todo) async {
    await db.deletTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Todo list"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          TodolList(
            inserFunction: addItem,
            deleteFuntion: deleteItem,
          ),
          Userinput(
            insertFuntion: addItem,
          ),
        ],
      ),
    );
  }
}
