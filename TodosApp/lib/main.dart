import 'package:TodosApp/providers/TaskProvider.dart';
import 'package:TodosApp/providers/UserInputProvider.dart';
import 'package:TodosApp/providers/UserProvider.dart';
import 'package:TodosApp/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodosModel()),
        ChangeNotifierProvider(create: (context) => UserInputProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),

      ],
      child: MaterialApp(
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
