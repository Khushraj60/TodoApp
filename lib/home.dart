import 'package:dfgh/todo.dart';
import 'package:dfgh/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ToDo> todosList = [];
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadToDoList();
  }

  Future<void> _loadToDoList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? todoListString = prefs.getString('todoList');
    if (todoListString != null) {
      List<dynamic> todoListJson = jsonDecode(todoListString);
      todosList = todoListJson.map((json) => ToDo.fromJson(json)).toList();
    } else {
      todosList = ToDo.todoList();
    }
    setState(() {
      _foundToDo = todosList;
    });
  }

  Future<void> _saveToDoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String todoListString = jsonEncode(
      todosList.map((todo) => todo.toJson()).toList(),
    );
    await prefs.setString('todoList', todoListString);
  }

  @override
  Widget build(BuildContext context) {
    List<ToDo> incompleteTasks =
        _foundToDo.where((todo) => !todo.isDone).toList();
    List<ToDo> completedTasks =
        _foundToDo.where((todo) => todo.isDone).toList();

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Personal',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Scrollbar(
                    child: SingleChildScrollView(
                      child: ReorderableListView(
                        shrinkWrap: true,
                        onReorder: _onReorderIncomplete,
                        children: [
                          for (ToDo todoo in incompleteTasks)
                            ToDoItem(
                              key: ValueKey(todoo.id),
                              todo: todoo,
                              onToDoChanged: _handleToDoChange,
                              onToDoDelete: deleteToDoChange,
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Completed',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Scrollbar(
                    child: SingleChildScrollView(
                      child: ReorderableListView(
                        shrinkWrap: true,
                        onReorder: _onReorderCompleted,
                        children: [
                          for (ToDo todoo in completedTasks)
                            ToDoItem(
                              key: ValueKey(todoo.id),
                              todo: todoo,
                              onToDoChanged: _handleToDoChange,
                              onToDoDelete: deleteToDoChange,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xfff3efee),
                      boxShadow: const [BoxShadow(color: Color(0xfff3efee))],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                        hintText: 'Write a task...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff000000),
                      minimumSize: const Size(30, 30),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Add',
                      style: TextStyle(fontSize: 28, color: Color(0xffffffff)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
    _saveToDoList();
  }

  void deleteToDoChange(ToDo todo) {
    setState(() {
      todosList.removeWhere((item) => item.id == todo.id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(
        ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo,
        ),
      );
    });
    _todoController.clear();
    _saveToDoList();
  }

  void _onReorderIncomplete(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final ToDo item = _foundToDo.removeAt(oldIndex);
      _foundToDo.insert(newIndex, item);
    });
    _saveToDoList();
  }

  void _onReorderCompleted(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final ToDo item = _foundToDo.removeAt(oldIndex);
      _foundToDo.insert(newIndex, item);
    });
    _saveToDoList();
  }
}
