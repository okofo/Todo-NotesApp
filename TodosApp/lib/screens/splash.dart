//import 'package:TodosApp/models/user.dart';
//import 'package:TodosApp/providers/UserProvider.dart';
//import 'package:TodosApp/screens/FirstPage.dart';
//import 'package:TodosApp/screens/NewAddScreen.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';

import 'HomePage.dart';
import 'WelcomePage.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  

Future<bool> checkSession() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});

    return false;
    }


    @override
  void initState() {
    super.initState();
    checkSession().then((status) {
      if (status) {
        navigationToWelcome();
      } else {
        navigationToWelcome();
      }
    });
  }

  

  void navigationToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => MyHomePage(),
      ),
    );
  }


  void navigationToWelcome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => WelcomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
  /*  var p = Provider.of<UserProvider>(context, listen: false);

  Future<Widget> checkSession() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});

    return Text(p.user.username);
  }*/


    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/logo.jpeg'), fit: BoxFit.cover),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Shimmer.fromColors(
              child: Text(
                '',
                style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: "GrenzeGotisch",
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 18.0,
                        color: Colors.black87,
                        offset: Offset.fromDirection(120, 12),
                      ),
                    ]),
              ),
              baseColor: Colors.black,
              highlightColor: Colors.amberAccent[200]),
         /* SizedBox(width: 10.0),
          Icon(
            Icons.note_add,
            color: Colors.blue,
          ),*/
        ],
      ),
    );
  }
}
