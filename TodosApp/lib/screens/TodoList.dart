import 'package:TodosApp/models/Task.dart';
import 'package:flutter/material.dart';
import 'TaskListItem.dart';

class TodoList extends StatelessWidget {
  final List<Task> tasks;

  TodoList({@required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenTasks(),
    );
  }

  List<Widget> getChildrenTasks() {
    return tasks.map((todo) => TaskListItem(task: todo)).toList();
  }
}