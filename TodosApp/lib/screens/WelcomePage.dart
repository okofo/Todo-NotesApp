import 'package:TodosApp/models/user.dart';
import 'package:TodosApp/providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'HomePage.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = TextEditingController();
  User user = User();

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
          child: Center(
            child: ListView(
              padding: EdgeInsets.all(40),
              shrinkWrap: true,
              children: [
                Text("Welcome", style: TextStyle(fontSize: 22)),
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (s) => user.username = s,
                  decoration: InputDecoration(
                    hintText: "Enter your username",
                  ),
                ),
                SizedBox(height: 30),
                RaisedButton(
                  elevation: 0,
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Text("Continue"),
                  onPressed: () {
                    p.setUser(user);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MyHomePage(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        )));
  }
}
