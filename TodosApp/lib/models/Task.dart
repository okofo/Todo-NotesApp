import 'package:flutter/material.dart';

class Task {
  String title;
 String body;

  bool completed;

  Task({@required this.title, this.body ,this.completed = false});

  void toggleCompleted() {
    completed = !completed;
  }

  
}

