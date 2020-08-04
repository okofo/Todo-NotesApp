import 'package:TodosApp/providers/NotesProvider.dart';
import 'package:TodosApp/screens/NewAddScreen.dart';
import 'package:TodosApp/screens/notesListitem.dart';
import 'package:TodosApp/utils/addButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesModel>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 50.0, left: 10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Notes',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Text(
                      ' ${provider.allNotes.length} Notes',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  width: 250,
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
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: provider.allNotes.length,
              itemBuilder: (context, index) {
                return NotesListItem(note: provider.allNotes[index]);
              },
            )
          ],
        ),
      ),
      floatingActionButton: AddButton(
        onPressed: () {
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
