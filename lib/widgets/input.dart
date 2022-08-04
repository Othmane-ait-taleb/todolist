import 'package:flutter/material.dart';
import 'package:todolist/model/todo.dart';

class Userinput extends StatelessWidget {
  final Function insertFuntion;
  Userinput({Key? key, required this.insertFuntion}) : super(key: key);

  var mycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: mycontroller,
                decoration: InputDecoration(hintText: "add todo ..."),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Todo todo = Todo(
                  title: mycontroller.text,
                  creationDate: DateTime.now(),
                  isChecked: false);
              insertFuntion(todo);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 23, vertical: 20),
              child: Text(
                "add",
                style: TextStyle(color: Colors.white),
              ),
              color: Color.fromARGB(255, 31, 30, 30),
            ),
          ),
        ],
      ),
    );
  }
}
