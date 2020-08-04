import 'package:TodosApp/models/Notes.dart';
import 'package:flutter/material.dart';
import 'notesListitem.dart';

class NotesList extends StatelessWidget {
  final List<Note> notes;

  NotesList({@required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenNotes(),
    );
  }

  List<Widget> getChildrenNotes() {
    return notes.map((notee) => NotesListItem(note: notee)).toList();
  }
}