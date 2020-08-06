import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:TodosApp/models/Task.dart';
import 'package:TodosApp/providers/TaskProvider.dart';
import 'package:provider/provider.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  TaskListItem({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0, top: 3, right: 8, left: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        color: Colors.blueGrey[100],
        elevation: 0.7,
        child: CheckboxListTile(
          title: Text(
            task.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(task.body),
          secondary: IconButton(
            icon: Icon(CupertinoIcons.delete, color: Colors.red),
            onPressed: () {
              Provider.of<TodosModel>(context, listen: false).deleteTodo(task);
            },
            alignment: Alignment.center,
          ),
          controlAffinity: ListTileControlAffinity.leading,
          value: task.completed,
          onChanged: (bool checked) {
            Provider.of<TodosModel>(context, listen: false).toggleTodo(task);
          },
          activeColor: Colors.white,
          checkColor: Colors.green,
        ),
      ),
    );
  }
}
