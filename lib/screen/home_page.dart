import 'package:flutter/material.dart';
import 'package:to_do/utlis/to_do_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ["Complete 5 question on leetcode", false],
    ["Watch 1 video of system design", false],
    ["do 5 commit on github", false],
  ];
  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
      
    });
  }

  // void saveNewTask() {
  //   setState(() {
  //     toDoList.add([_controller.text, false]);
  //     _controller.clear();
  //   });
  //   Navigator.of(context).pop();
  // }
  void saveNewTask() {
    if (_controller.text.trim().isEmpty) return; // Prevent empty task addition
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9575C0),
      appBar: AppBar(
        title: const Text("My Day"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return ToDoList(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (p0) => checkBoxChanged(index),
            deleteFunction: (p0) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _controller,
                   decoration: InputDecoration(
                    hintText: "Add New Task",
                    filled: true,
                    fillColor: Colors.deepPurple[200],
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
