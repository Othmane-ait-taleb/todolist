import 'package:flutter/material.dart';
import 'package:todolist/model/db_model.dart';
import 'package:todolist/widgets/todo_card.dart';

class TodolList extends StatelessWidget {
  var db = DatabaseConnect();
  Function inserFunction;
  Function deleteFuntion;
  TodolList(
      {Key? key, required this.inserFunction, required this.deleteFuntion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodo(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var datalenght = data!.length;

          return datalenght == 0
              ? Center(
                  child: Text("no data to load"),
                )
              : ListView.builder(
                  itemCount: datalenght,
                  itemBuilder: (BuildContext context, int index) {
                    return TodoCard(
                        id: data[index].id,
                        title: data[index].title,
                        creationDate: data[index].creationDate,
                        isChecked: data[index].isChecked,
                        insertFunction: inserFunction,
                        deleteFunction: deleteFuntion);
                  },
                );
        },
      ),
    );
  }
}
