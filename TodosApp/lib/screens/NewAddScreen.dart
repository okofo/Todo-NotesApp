import 'package:TodosApp/models/Task.dart';
import 'package:TodosApp/models/userInput.dart';
import 'package:TodosApp/providers/TaskProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final controller = TextEditingController();
  final controller2 = TextEditingController();

  UserInput user = UserInput();
  UserInput userp = UserInput();

  @override
  Widget build(BuildContext context) {
    void onAdd() {
      final String textVal = controller.text;
      final String textVal2 = controller2.text;

      final Task todo = Task(title: textVal, body: textVal2);
      Provider.of<TodosModel>(context, listen: false).addTodo(todo);
      Navigator.pop(context);
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
          child: Center(
            child: ListView(
              padding: EdgeInsets.all(40),
              shrinkWrap: true,
              children: [
                Text("Add a new task", style: TextStyle(fontSize: 22)),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Task Title",
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: controller2,
                  decoration: InputDecoration(
                    hintText: "Enter task body",
                  ),
                ),
                SizedBox(height: 30),
                RaisedButton(
                  elevation: 0,
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Text("Add"),
                  onPressed: onAdd,
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        )));
  }
}
