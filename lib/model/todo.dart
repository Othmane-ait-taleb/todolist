class Todo {
  String title;
  int? id;
  DateTime creationDate;
  bool isChecked;

  Todo(
      {required this.title,
      this.id,
      required this.creationDate,
      required this.isChecked});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "creationDate": creationDate.toString(),
      "isChecked": isChecked ? 1 : 0,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Todo(id: $id,title:  $title,DateTime: $creationDate,isChecked: $isChecked)";
  }
}
