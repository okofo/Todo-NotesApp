import 'package:flutter/material.dart';

class Note {
  String title;
 String body;
 int id;
 DateTime dateCreated;
  DateTime dateLastModified;

  Note({@required this.title, this.body , this.dateCreated , this.dateLastModified, this.id });

 int epochFromDate(DateTime dt) {
    return dt.millisecondsSinceEpoch ~/ 1000 ;
  }
  
}

