import 'package:TodosApp/screens/NewAddScreen.dart';
import 'package:TodosApp/screens/tabs/AllTasks.dart';
import 'package:TodosApp/screens/tabs/CompletedTasks.dart';
import 'package:TodosApp/screens/tabs/IncompleteTasks.dart';
import 'package:TodosApp/utils/addButton.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:  IconButton(
            icon: Icon(Icons.navigate_before, color: Colors.black, size: 32),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
        title: Text(
          'Tasks',
         style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
       ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Welcome(),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          indicatorColor: Colors.blue[300],
          labelColor: Colors.blue,
          controller: controller,
          unselectedLabelColor: Colors.blueGrey,
          tabs: <Widget>[
            Tab(
                child: Text(
              'AllTasks',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
            Tab(
                child: Text(
              'InComplete',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            )),
            Tab(
                child: Text(
              'Complete',
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          AllTasksTab(),
          IncompleteTasksTab(),
          CompletedTasksTab(),
        ],
      ),
      floatingActionButton: AddButton(onPressed: () {
        Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Welcome(),
                ),
              );
            },
      ),
    );
  }
}
