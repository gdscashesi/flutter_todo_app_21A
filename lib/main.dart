import 'package:flutter/material.dart';
import 'package:todo/ui/screens/homescreen/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        textTheme: const TextTheme(
          headline4: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),
          headline6: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),
          subtitle1: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.w500
          )
        ),
        primarySwatch: Colors.teal,
        buttonTheme: ButtonThemeData(
          padding: const EdgeInsets.all(8),
          buttonColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )
        )
      ),
      home: const SafeArea(
        bottom: false,
          child: HomeScreen()
      ),
    );
  }
}