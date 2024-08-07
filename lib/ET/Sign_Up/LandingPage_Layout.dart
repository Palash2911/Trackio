import 'package:expense_tracker/ET/Main_Layouts/Bottomnav_layout.dart';
import 'package:expense_tracker/ET/Services/firebaseAuth.dart';
import 'package:expense_tracker/ET/Sign_Up/login_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class landingPage extends StatefulWidget {
  landingPage({required this.auth});
  final AuthClass auth;
  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
   Users? _user;

  @override
  void initState() {
    _getData();
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {return _updateUser(_user!); });
  }

   Future<void> _getData() async{
    try {
      await Firebase.initializeApp();
      Users? user = await widget.auth.currentUser();
      _updateUser(user);
    } catch (e) {
      print(e.toString());
    }
  }
  void _updateUser(Users? user) {
      setState((){
        _user = user;
      });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return Login(
        auth: widget.auth,
        onLogIn: _updateUser,
      );
    }
    return Bottomnav(
      auth: widget.auth,
    );
  }
}
