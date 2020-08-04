import 'dart:collection';
import 'package:TodosApp/models/Task.dart';
import 'package:flutter/material.dart';

class TodosModel extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'Finish the app', body: 'grab some food'),
    Task(title: 'Write a blog post', body: 'Body for show'),
    Task(title: 'Share with community', body: 'be compo anaa'),
  ];

  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_tasks);
  UnmodifiableListView<Task> get incompleteTasks =>
      UnmodifiableListView(_tasks.where((todo) => !todo.completed));
  UnmodifiableListView<Task> get completedTasks =>
      UnmodifiableListView(_tasks.where((todo) => todo.completed));

  void addTodo(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTodo(Task task) {
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTodo(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
