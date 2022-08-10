import 'package:expense_tracker/ET/Main_Layouts/Dashboard/dashboard_layout.dart';
import 'package:expense_tracker/ET/Main_Layouts/Graphs/graphw_layout.dart';
import 'package:expense_tracker/ET/Main_Layouts/Setting/setting_layout.dart';
import 'package:flutter/material.dart';

import '../Services/firebaseAuth.dart';


class Bottomnav extends StatefulWidget {
  Bottomnav({required this.auth});
  // const Bottomnav({Key? key}) : super(key: key);
  final AuthClass auth;

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int indx = 0;
  Future<void> _sign() async{
    // bottom();
  }
  var tit = ["Home","Graph","Setting"];
  List<Widget> _children() =>
      [
        dashBoard(),
        graphW(),
        Setting(auth: widget.auth,),
      ];

  void _onItemTapped(int index) {
    setState(() {
      indx = index;
      var auth = widget.auth;
    });
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = _children();
    return Scaffold(
      appBar: AppBar(
        title: Text(tit[indx].toString()),
      ),
      body: Center(
        child: _widgetOptions[indx],
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
