import 'package:TodosApp/models/Notes.dart';
import 'package:flutter/material.dart';


class NotesListItem extends StatelessWidget {
  final Note note;
    final Note onTap;


  NotesListItem({@required this.note,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Container(
            height: 180.0,
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.grey[50]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    TimeOfDay.now().toString(),
                    style: new TextStyle(
                        fontSize: 10.0,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    note.title,
                    style: new TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    note.body,
                    style: new TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
