import 'package:TodosApp/models/Notes.dart';
import 'package:flutter/material.dart';

class NotesModel extends ChangeNotifier {
  final List<Note> _notes = [
    Note(title: 'Finish the app ehddndnnd', body: 'grab some food'),
    Note(title: 'Write a blog post', body: 'Body for show'),
    Note(title: 'Share with community', body: 'Yes of course , i will have to send the file to Arkinsta team first for review'),
  ];

  List<Note> get allNotes => _notes;

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void deleteNote(Note note) {
    _notes.remove(note);
    notifyListeners();
  }
}
