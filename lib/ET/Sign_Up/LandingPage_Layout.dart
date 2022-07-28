import 'package:expense_tracker/ET/Main_Layouts/Bottomnav_layout.dart';
import 'package:expense_tracker/ET/Main_Layouts/Dashboard/dashboard_layout.dart';
import 'package:expense_tracker/ET/Sign_Up/login_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class landingPage extends StatefulWidget {
  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
   User? _user;

  void _updateUser(User user) {
      setState((){
        _user = user;
      });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return Login(
        onLogIn: _updateUser,
      );
    }
    return Bottomnav();
  }
}
