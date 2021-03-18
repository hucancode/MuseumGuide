import 'package:flutter/material.dart';
import 'package:museum_guide/navigators/app_navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museum Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 20),
          headline5: TextStyle(fontSize: 18),
          bodyText1: TextStyle(fontSize: 12),
        ),
      ),
      home: AppNavigator(),
    );
  }
}
