import 'package:expense_tracker/ET/Main_Layouts/Bottomnav_layout.dart';
import 'package:expense_tracker/ET/Sign_Up/login_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class landingPage extends StatefulWidget {
  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
   User? _user;


  @override
  void initState() {
    _getData();
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {return _updateUser(_user!); });
  }

   Future<void> _getData() async{
    try {
      await Firebase.initializeApp();
      User? user = FirebaseAuth.instance.currentUser;
      _updateUser(user);
    } catch (e) {
      print(e.toString());
    }
  }
  void _updateUser(User? user) {
      setState((){
        _user = user;
      });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      print("user null hai bawa");
      return Login(
        onLogIn: _updateUser,
      );
    }
    print("nice bhai");
    return Bottomnav();
  }
}
