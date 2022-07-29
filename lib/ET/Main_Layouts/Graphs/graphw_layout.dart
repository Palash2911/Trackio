import 'package:expense_tracker/ET/Main_Layouts/Graphs/graphm_layout.dart';
import 'package:expense_tracker/ET/Main_Layouts/Graphs/graphy_layout.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/ET/Main_Layouts/Bottomnav_layout.dart';

class graphW extends StatelessWidget {
  const graphW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ButtonTheme(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    minWidth: 120.0,
                    child: RaisedButton(
                      textColor: Colors.white,
                      onPressed: () {
                        null;
                      },
                      child: const Text(
                        "Weekly",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ButtonTheme(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  minWidth: 120.0,
                  child: RaisedButton(
                    textColor: Colors.white,
                    onPressed: () {
                      graphM();
                    },
                    child: const Text(
                      "Monthly",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ButtonTheme(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  minWidth: 120.0,
                  child: RaisedButton(
                    textColor: Colors.white,
                    onPressed: () {
                      graphY();
                    },
                    child: const Text(
                      "Yearly",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("History ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            ),
          ],
        ),
      ),
    );
  }
}

