import 'package:expense_tracker/ET/Main_Layouts/Bottomnav_layout.dart';
import 'package:flutter/material.dart';

class dashBoard extends StatelessWidget {
  const dashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('LOG IN', style: TextStyle(fontWeight: FontWeight.bold)),
      // ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ButtonTheme(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                minWidth: 380.0,
                child: RaisedButton(
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bottomnav()));
                  },
                  child: const Text(
                    "Add Expense",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Upcoming Expenses ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            ),

          ],
        ),
      ),
    );
  }
}

