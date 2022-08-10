import 'package:expense_tracker/ET/Services/firebaseAuth.dart';
import 'package:expense_tracker/ET/Sign_Up/LandingPage_Layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  // const Setting({Key? key}) : super(key: key);
  // final FunctionStringCallback callback;
  // Setting({required this.callback});
  Setting({required this.auth});
  final AuthClass auth;

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool signout = false;

  Future<void> _Signout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
         context ,MaterialPageRoute(builder: (context) => landingPage(auth: widget.auth)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ButtonTheme(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  minWidth: 400.0,
                  height: 45.0,
                  child: RaisedButton(
                    textColor: Colors.white,
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => Bottomnav()));
                    },
                    child: const Text(
                      "Your Account",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ButtonTheme(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                minWidth: 400.0,
                height: 45.0,
                child: RaisedButton(
                  textColor: Colors.white,
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => Bottomnav()));
                  },
                  child: const Text(
                    "Export as PDF",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ButtonTheme(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                minWidth: 400.0,
                height: 45.0,
                child: RaisedButton(
                  textColor: Colors.white,
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => Bottomnav()));
                  },
                  child: const Text(
                    "Edit Upcoming Expenses",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ButtonTheme(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                minWidth: 400.0,
                height: 45.0,
                child: RaisedButton(
                  textColor: Colors.white,
                  onPressed: _Signout,
                  child: const Text(
                    "Log Out",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

