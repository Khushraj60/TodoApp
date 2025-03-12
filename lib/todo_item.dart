import 'package:dfgh/todo.dart';
import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;

  final onToDoChanged;

  final onToDoDelete;
  const ToDoItem({
    super.key,
    required this.todo,
    required this.onToDoChanged,
    required this.onToDoDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: const Color(0xfff3efee),
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: const Color(0xff9f9f9f),
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color:
                todo.isDone ? const Color(0xff9f9f9f) : const Color(0xff121212),
            decoration: todo.isDone ? TextDecoration.none : TextDecoration.none,
          ),
        ),
        trailing: ReorderableDragStartListener(
          index: int.parse(todo.id),
          child: IconButton(
            onPressed: () {
              onToDoDelete(todo);
            },
            icon: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
