import 'package:flutter/cupertino.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'todo.dart';

class DatabaseConnect {
  Database? _database;

  Future<Database> get database async {
    final dbpath = await getDatabasesPath();
    const dbname = "todo.db";
    final path = join(dbpath, dbname);

    _database = await openDatabase(path, version: 1, onCreate: _createDB);
    if (_database == null) {
      print("problem in data base creation");
      return _database!;
    } else
      return _database!;
  }

  Future<void> _createDB(Database DB, int version) async {
    await DB.execute('''CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT
    ,title TEXT,
    creationDate TEXT
    ,isChecked INTEGER)''');
  }

  Future<void> insertTodo(Todo todo) async {
    final db = await database;
    await db.insert("todo", todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deletTodo(Todo todo) async {
    final db = await database;
    await db.delete("todo", where: "id == ?", whereArgs: [todo.id]);
  }

  Future<List<Todo>> getTodo() async {
    final db = await database;
    List<Map<String, dynamic>> items =
        await db.query('todo', orderBy: 'id DESC');

    return List.generate(
        items.length,
        (index) => Todo(
              creationDate: DateTime.parse(items[index]['creationDate']),
              id: items[index]['id'],
              title: items[index]['title'],
              isChecked: items[index]['isChecked'] == 1 ? true : false,
            ));
  }
}
