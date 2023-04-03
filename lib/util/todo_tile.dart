import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onchanged;
  final Function(BuildContext context) deleteTask;
   const TodoTile({super.key, required this.taskName, required this.taskCompleted, required this.onchanged, required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
          ]),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12 )
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted, 
                  onChanged: onchanged,
                  activeColor: Colors.black,
                  ),
      
                Text(taskName,
                style: TextStyle
                (decoration: taskCompleted ? TextDecoration.lineThrough 
                : TextDecoration.none),),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 