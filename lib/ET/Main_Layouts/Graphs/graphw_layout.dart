import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/ET/Models/newExpense.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Services/firebaseAuth.dart';

class graphW extends StatefulWidget {
  graphW({required this.auth});
  final AuthClass auth;

  @override
  State<graphW> createState() => _graphWState();
}

class _graphWState extends State<graphW> {
  @override
  Widget build(BuildContext context) {
    getUsersdata();
    return Scaffold(
        body: Column(children: [
      const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            "History",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: StreamBuilder<List<newExpense>>(
            stream: widget.auth.listExpense(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("Loading..");
              }
              List<newExpense> expenses = snapshot.data as List<newExpense>;
              if (expenses.isEmpty) {
                return const Padding(
                    padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: Text(
                      "No History to Show",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ));
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: EdgeInsets.all(0),
                          child: Card(
                            child: SizedBox(
                              width: 300,
                              height: 72,
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 110,
                                      ),
                                      Text(
                                        expenses[index].category,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 9,
                                      ),
                                      Text(
                                        expenses[index]
                                            .date
                                            .toString()
                                            .split(",")[0],
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 110,
                                  ),
                                  RichText(
                                      text: const TextSpan(children: [
                                    TextSpan(
                                        text: "- ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black54)),
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.currency_rupee,
                                      size: 18,
                                      color: Colors.black54,
                                    )),
                                  ])),
                                  Text(
                                    expenses[index].amount,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  );
                },
              );
            },
          ))
      )]));
  }

  Future getUsersdata() async {
    final auth = await FirebaseAuth.instance.currentUser;
    CollectionReference users =
        await FirebaseFirestore.instance.collection('Users');
    Stream<QuerySnapshot<Map<String, dynamic>>> snappy =
        await users.doc(auth?.uid).collection('History').snapshots();
    return snappy as Stream<QuerySnapshot>;
  }
}
