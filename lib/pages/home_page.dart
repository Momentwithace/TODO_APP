import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }else {
      db.loadData(); 
    }
    super.initState();
  }

  final _controller = TextEditingController();
 


  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1]; 
    });
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          controller: _controller, 
          onSave: saveNewTask,
          onCancel: () => Navigator.pop(context), 
        );
      });
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void saveNewTask(){
     setState(() {
      if (_controller.text.isEmpty){
        return db.updateDataBase();
      }else {
       db.toDoList.add([_controller.text, false]);
       _controller.clear();
     }});
     Navigator.pop(context);
     db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("TO DO"),
        centerTitle: true,
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
       child:const Icon(Icons.add),),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1], 
            onchanged: (value) => checkBoxChanged(value, index), 
            deleteTask: (context) => deleteTask(index),
            );
        },
      ),
    );
  }
}