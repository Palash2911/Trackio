import 'package:expense_tracker/ET/Main_Layouts/Bottomnav_layout.dart';
import 'package:expense_tracker/ET/Sign_Up/login_layout.dart';
import 'package:expense_tracker/ET/Sign_Up/signup_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool login = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (login?Bottomnav():Signup()),
    );
  }
}

