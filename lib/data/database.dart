import 'package:hive/hive.dart';

class ToDoDataBase{

  List toDoList = [];

  final _myBox = Hive.box("myBox");

  void createInitialData(){
    toDoList = [
      ["Go to work", false],
      ["Get grocery", true]
    ];
  }

  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase(){
    _myBox.put("TODOLIST", toDoList);
  }

}
