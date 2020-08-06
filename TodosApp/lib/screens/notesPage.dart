import 'package:TodosApp/providers/NotesProvider.dart';
import 'package:TodosApp/screens/AddNote.dart';
import 'package:TodosApp/screens/notesListitem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'HomePage.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesModel>(context, listen: false);
    int _id;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 30.0, left: 10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 2.0),
                      child: Text(
                        'Notes',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        ' ${provider.allNotes.length} Notes',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 220,
                ),
                Card(
                  color: Colors.purple[200],
                  shape: CircleBorder(),
                  child: IconButton(
                    alignment: Alignment.center,
                    icon: Icon(CupertinoIcons.pen,
                        color: Colors.white, size: 23.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddNoteScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              /*   onTap:(){
              setState((){
              _id = index;
              });
              _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text("You clicked item number $index")));
                },*/
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: provider.allNotes.length,
                itemBuilder: (context, int index) {
                  return NotesListItem(note: provider.allNotes[index]);
                },
              ),
            ),

            /* Container( color: Colors.grey,
              child: Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
              
               Card(
                      color: Colors.grey[300],
                      shape: CircleBorder(),
                      child: IconButton(
                        alignment: Alignment.center,
                        icon: Icon(CupertinoIcons.home,
                            color: Colors.black, size: 23.0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        },
                      ),
                    ),
               
                  Card(
                    color: Colors.purple[300],
                    shape: CircleBorder(),
                    child: IconButton(
                      alignment: Alignment.center,
                      icon: Icon(CupertinoIcons.pen,
                          color: Colors.white, size: 23.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Welcome(),
                          ),
                        );
                      },
                    ),
                  
               ),
              ],),
            ),*/
          ],
        ),
      ),
      floatingActionButton: Card(
        color: Colors.grey[300],
        shape: CircleBorder(),
        child: IconButton(
          alignment: Alignment.center,
          icon: Icon(CupertinoIcons.home, color: Colors.black, size: 23.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
