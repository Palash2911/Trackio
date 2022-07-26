import 'package:expense_tracker/ET/Main_Layouts/Dashboard/dashboard_layout.dart';
import 'package:expense_tracker/ET/Main_Layouts/Graphs/graphw_layout.dart';
import 'package:expense_tracker/ET/Main_Layouts/Setting/setting_layout.dart';
import 'package:flutter/material.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({Key? key}) : super(key: key);

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int indx = 0;
  var tit = "Dashboard";

  static const List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    GraphW(),
    Setting(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      indx = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tit),
      ),
      body: Center(
        child: _widgetOptions.elementAt(indx),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_rounded),
            label: 'Graph',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: indx,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
