import 'package:expense_tracker/ET/Main_Layouts/Graphs/graphw_layout.dart';
import 'package:expense_tracker/ET/Main_Layouts/Graphs/graphy_layout.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/ET/Main_Layouts/Bottomnav_layout.dart';

class GraphM extends StatefulWidget {
  const GraphM({Key? key}) : super(key: key);

  @override
  State<GraphM> createState() => _GraphMState();
}

class _GraphMState extends State<GraphM> {
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => GraphW()));
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => GraphM()));
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => GraphY()));
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
