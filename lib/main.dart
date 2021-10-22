import 'package:flutter/material.dart';
import 'package:todo/ui/screens/homescreen/homescreen.dart';
import 'package:todo/ui/screens/login_screen/login_screen.dart';
import 'package:todo/utils/constants.dart';

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
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        // canvasColor: Colors.white,
        backgroundColor: secondaryColor,
        // scaffoldBackgroundColor: secondaryColor,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColor
        ),
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
            color: primaryColor,
            fontWeight: FontWeight.w500
          )
        ),
        primarySwatch: MaterialColor(primaryColor.value, primaryColorSwatch),
        buttonTheme: ButtonThemeData(
          padding: const EdgeInsets.all(8),
          buttonColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )
        )
      ),
      home:  SafeArea(
        bottom: false,
          child: LoginScreen()
      ),
    );
  }
}