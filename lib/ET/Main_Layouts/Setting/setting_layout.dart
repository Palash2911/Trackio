import 'package:expense_tracker/ET/Sign_Up/login_layout.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/ET/Main_Layouts/Bottomnav_layout.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Bottomnav()));
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Bottomnav()));
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Bottomnav()));
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
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Login()));
                    },
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
      ),
    );
  }
}
