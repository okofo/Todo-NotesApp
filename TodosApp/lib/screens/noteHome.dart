import 'package:TodosApp/models/Notes.dart';
import 'package:TodosApp/providers/NotesProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NoteHome extends StatefulWidget {
  @override
  _NoteHomeState createState() => _NoteHomeState();
}

class _NoteHomeState extends State<NoteHome> {
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
            new BottomNavigationBarItem(icon: Icon(CupertinoIcons.mic)),
            new BottomNavigationBarItem(icon: Icon(Icons.photo)),
            new BottomNavigationBarItem(icon: Icon(CupertinoIcons.music_note)),
            new BottomNavigationBarItem(
              icon: Icon(Icons.text_fields),
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
   final Note notes ;
     MainContent({ this.notes});

  @override
  Widget build(BuildContext context) {
   

    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy hh:mm a');
    final String formatted = formatter.format(now);

    //final provider = Provider.of<NotesModel>(context, listen: false);

    return ListView(
      children: <Widget>[
        Column(
          children: [
            Row(
              children: [
                Text(notes.title),
                IconButton(
                  icon: Icon(CupertinoIcons.delete, color: Colors.grey),
                  onPressed: () {
                    Provider.of<NotesModel>(context, listen: false)
                        .deleteNote(notes);
                  },
                  alignment: Alignment.center,
                ),
              ],
            ),
            Text(formatted),
            Text(notes.body),
          ],
        ),
      ],
    );
  }
}
