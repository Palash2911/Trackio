import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
  Future<void> _sign() async {
    // bottom();
  }
  final navicons = const [
    Icon(
      Icons.home_filled,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.auto_graph_rounded,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.settings,
      size: 30,
      color: Colors.white,
    ),
  ];

  var tit = ["Home", "Graph", "Setting"];
  List<Widget> _children() => [
        dashBoard( auth: widget.auth,),
        graphW(),
        Setting(
          auth: widget.auth,
        ),
      ];

  void _onItemTapped(int index) {
    setState(() {
      indx = index;
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
      bottomNavigationBar: buildnavbar(context),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.auto_graph_rounded),
      //       label: 'Graph',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //     ),
      //   ],
      //   currentIndex: indx,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
    );
  }

  Container buildnavbar(BuildContext context) {
    return Container(
      height: 50,
      // decoration: BoxDecoration(
      //   color: Theme.of(context).primaryColor,
      //   borderRadius: const BorderRadius.only(
      //     topLeft: Radius.circular(20),
      //     topRight: Radius.circular(20),
      //   ),
      // ),
      child: CurvedNavigationBar(
        color: const Color.fromRGBO(0, 119, 182, 1),
        backgroundColor: Colors.transparent,
        items: navicons,
        buttonBackgroundColor: const Color.fromRGBO(5, 102, 141, 1),
        animationCurve: Curves.linearToEaseOut,
        animationDuration: const Duration(milliseconds: 810),
        onTap: _onItemTapped,
      ),
    );
  }
}
