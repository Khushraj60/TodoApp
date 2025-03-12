class ToDo {
  final String id;
  final String? todoText; //if user click add it add even todoText is
  bool isDone;

  ToDo({required this.id, required this.todoText, this.isDone = false});

  // Map<String, dynamic> toMap() {
  //   return {"id": id, "todoText": todoText, "isDone": isDone};
  // }

  // static ToDo fromMap(Map<String, dynamic> json) {
  //   return ToDo(
  //     id: json['id'],
  //     todoText: json['todoText'],
  //     isDone: json['isDone'],
  //   );
  // }

  factory ToDo.fromJson(Map<String, dynamic> json) =>
      ToDo(id: json['id'], todoText: json['todoText'], isDone: json['isDone']);

  Map<String, dynamic> toJson() {
    return {'id': id, 'todoText': todoText, 'isDone': isDone};
  }

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Buy groceries', isDone: true),
      ToDo(id: '02', todoText: 'Walk the dog', isDone: false),
    ];
  }
}

// ToDo todo = ToDo(id: "01", todoText: "Buy meat every weeekend",isDone:true);
