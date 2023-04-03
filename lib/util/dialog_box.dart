import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  
  DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.yellow[300],
        content: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(border: OutlineInputBorder(),
                hintText: "Add a New Task"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(
                    name: "Save", 
                    onPressed: onSave
                    ),
                  
                  const SizedBox(width: 10,),
                  MyButton(
                    name: "Cancel", 
                    onPressed: onCancel
                    )
                ],
              )
            ],
          ),
        ),
    );
  }
}