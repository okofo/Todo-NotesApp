import 'package:TodosApp/providers/NotesProvider.dart';
import 'package:TodosApp/providers/TaskProvider.dart';
import 'package:TodosApp/providers/UserProvider.dart';
import 'package:TodosApp/screens/notesPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'Home.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
          elevation: 25,
          type: BottomNavigationBarType.fixed,
          fixedColor: Color(0XFF29D091),
          currentIndex: _bottomNavIndex,
          onTap: (int index) {
            setState(() {
              _bottomNavIndex = index;
            });
          },
          items: [
            new BottomNavigationBarItem(
                title: Text('Home'), icon: Icon(Icons.home)),
            new BottomNavigationBarItem(
                title: Text('Add'), icon: Icon(Icons.add)),
            new BottomNavigationBarItem(
                title: Text('All'), icon: Icon(Icons.note)),
            new BottomNavigationBarItem(
              title: Text('Date'),
              icon: Icon(Icons.calendar_today),
            )
          ]),
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Colors.blueAccent),
      ),
      body: MainContent(),
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String getGreetingMessage() {
      final hour = DateTime.now().hour;
      String greeting;

      if (hour < 12) {
        greeting = 'Good Morning';
      } else if (hour < 18) {
        greeting = 'Good Afternoon';
      } else {
        greeting = 'Good Evening';
      }
      return greeting;
    }

    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy hh:mm a');
    final String formatted = formatter.format(now);

    final p = Provider.of<UserProvider>(context, listen: false);
    final numTodos = Provider.of<TodosModel>(context, listen: false);
    final provider = Provider.of<NotesModel>(context, listen: false);


    String user = p.user.username;
    var num1 = numTodos.allTasks.length.toString();
   var num2 = provider.allNotes.length.toString();


    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: new Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.settings),
                    onPressed: null),
                Row(children: [
                  new Text(
                    ('Hello $user'),
                    style: TextStyle(
                        fontSize: 27.0,
                        fontFamily: 'Modak',
                        color: Colors.blueGrey),
                    textAlign: TextAlign.left,
                  ),
                  // CircleAvatar()
                ]),
                SizedBox(
                  height: 0.0,
                ),
                Row(
                  children: <Widget>[
                    new Text(
                      getGreetingMessage(),
                      style: TextStyle(
                          fontSize: 25.0),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(height: 30.0),
                Text(formatted,
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left),
                Divider(height: 20.0),
                SizedBox(height: 20),
                Text(
                  ('Choose an activity'),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
                        },
                        child: new Container(
                          height: 180.0,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Tasks',
                                  style: new TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  ' $num1 Tasks',
                                  style: new TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blueGrey,
                                      fontFamily: 'GrenzeGotisch'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => NotesPage()));
                        },
                        child: new Container(
                          height: 180.0,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Notes',
                                  style: new TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  ' $num2 Notes',
                                  style: new TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blueGrey,
                                      fontFamily: 'GrenzeGotisch'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
                        },
                        child: new Container(
                          height: 180.0,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Ideas',
                                  style: new TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  ' 5 Ideas',
                                  style: new TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blueGrey,
                                      fontFamily: 'GrenzeGotisch'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    new Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
                        },
                        child: new Container(
                          height: 180.0,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Bookmarks',
                                  style: new TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  ' 7 Bookmarks',
                                  style: new TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blueGrey,
                                      fontFamily: 'GrenzeGotisch'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
