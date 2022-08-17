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
      body: StreamBuilder<List<newExpense>>(
        stream: widget.auth.listExpense(),
        builder: (context, snapshot){
          if (!snapshot.hasData) {
            return const Text("Loading..");
          }
          List<newExpense> expenses= snapshot.data as List<newExpense>;
          return ListView.builder(
              shrinkWrap: true,itemCount: expenses.length,
              itemBuilder: (context, index){
                return Container(
                  child: Column(
                     children: [
                       Row(

                       ),
                       Text("Amount: " + expenses[index].amount),
                       Text("Date: " +  expenses[index].date),
                       Text("Category: " + expenses[index].category),
                       SizedBox(
                         height: 10,
                       )
                     ],
                  )
                );
            },);
        },
      )
    );
  }

  Future getUsersdata() async{
    final auth = await FirebaseAuth.instance.currentUser;
    CollectionReference users = await FirebaseFirestore.instance.collection('Users');
    Stream<QuerySnapshot<Map<String, dynamic>>> snappy = await users.doc(auth?.uid).collection('History').snapshots();
    return snappy as Stream<QuerySnapshot>;
  }
}
