import 'package:TodosApp/screens/NewAddScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  AddButton({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.blueGrey[300].withOpacity(0.8),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: IconButton(
        onPressed: () { Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Welcome(),
                ),
              );
            },
        icon: Icon(
          CupertinoIcons.add,
          color: Colors.black,
          size: 28,
        ),
      ),
    );
  }
}
