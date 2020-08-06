import 'package:TodosApp/models/Notes.dart';
import 'package:TodosApp/models/userInput.dart';
import 'package:TodosApp/providers/NotesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  AddNoteScreen({Key key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final controller = TextEditingController();
  final controller2 = TextEditingController();

  UserInput user = UserInput();
  UserInput userp = UserInput();

  @override
  Widget build(BuildContext context) {
    void onAdd() {
      final String textVal = controller.text;
      final String textVal2 = controller2.text;

      final Note note = Note(title: textVal, body: textVal2);
      Provider.of<NotesModel>(context, listen: false).addNote(note);
      Navigator.pop(context);
    }

    return Scaffold(
        backgroundColor: Colors.white,
       // appBar: AppBar(),
        body: Center(
            child: Container(
          child: Center(
            child: ListView(
              padding: EdgeInsets.all(40),
              shrinkWrap: true,
              children: [
                Text("Add a new note", style: TextStyle(fontSize: 22)),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: controller2,
                  // cursorColor: Colors.black,
                  decoration: new InputDecoration(
                    hintText: "Notes",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
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
