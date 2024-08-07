import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Services/firebaseAuth.dart';

class dashBoard extends StatefulWidget {
  // const dashBoard({Key? key}) : super(key: key);
  dashBoard({required this.auth});
  final AuthClass auth;

  @override
  State<dashBoard> createState() => _dashBoardState();
}

class _dashBoardState extends State<dashBoard> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController _datecontroller = TextEditingController();
  TextEditingController _amtcontroller = TextEditingController();
  TextEditingController _notecontroller = TextEditingController();
  String get date => _datecontroller.text;
  String get amt => _amtcontroller.text;
  String get category => _notecontroller.text;
  int budget = 0;
  int moneySpent = 0;
  bool dateCheck = true;
  bool amtCheck = true;
  bool noteCheck = true;
  bool btnPress = true;

  bool validator(String check) {
    if (check.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    _datecontroller.text = "";
    _amtcontroller.text = "";
    _notecontroller.text = "";
    //set the initial value of text field
    super.initState();
  }

  void _getexp() async {
    String temp = await widget.auth.getexpense();
    setState(() {
      budget = int.parse(temp.split(" ").last);
      moneySpent = budget - int.parse(temp.split(" ").first);
    });
  }

  void _addnewExpense() async {
    widget.auth.newexpense(amt, date, category).toString();
    // totalAmt = int.parse(widget.auth.getexpense().toString().toString());
  }

  @override
  Widget build(BuildContext context) {
    _getexp();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('LOG IN', style: TextStyle(fontWeight: FontWeight.bold)),
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 70,
              width: 300,
              child: Row(
                children: [
                  SizedBox(
                    height: 70,
                    width: 150,
                    child: Card(
                      child: Column(children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Text("Monthly Budget"),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          budget.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                      height: 70,
                      width: 150,
                      child: Card(
                          child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),
                          moneySpent >= 0
                              ? const Align(
                                  child: Text(
                                    "Money Left",
                                    style: TextStyle(color: Colors.green),
                                  ))
                              : const Text("Money Extra Spent",
                                  style: TextStyle(color: Colors.red)),
                          const SizedBox(
                            height: 7,
                          ),
                          moneySpent >= 0
                              ? Text(
                                  moneySpent.toString(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                )
                              : Text("${0 - moneySpent}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green))
                        ],
                      ))),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                // height: 100,
                width: 300,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _datecontroller.text = "";
                      _amtcontroller.text = "";
                      _notecontroller.text = "";
                    });
                    showDialog(
                        context: context,
                        builder: (context) => SingleChildScrollView(
                            child: Container(
                                margin: const EdgeInsets.only(top: 110.0),
                                child:Form(
                                  key: _key,
                                    child: AlertDialog(
                                  title: const Center(
                                      child: Text("Enter Details")),
                                  actions: [
                                    TextFormField(
                                      controller: _amtcontroller,
                                      decoration: const InputDecoration(
                                        icon: Icon(Icons.currency_rupee),
                                        border: OutlineInputBorder(),
                                        labelText: "Amount",
                                      ),
                                      validator: (value){
                                        if(value == null || value.isEmpty)
                                          {
                                            return 'Amount Required !';
                                          }
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                    ),
                                    const SizedBox(
                                      width: 100,
                                      height: 30,
                                    ),
                                    TextFormField(
                                        controller: _datecontroller,
                                        // onTap: ,
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.calendar_today),
                                          border: OutlineInputBorder(),
                                          labelText: "Choose Date",
                                        ),
                                        validator: (value){
                                          if(value == null || value.isEmpty)
                                          {
                                            return 'Date Not Set !';
                                          }
                                          return null;
                                        },
                                        readOnly: true,
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2022),
                                                  lastDate: DateTime(2050));
                                          if (pickedDate != null) {
                                            //pickedDate output format => 2021-03-10 00:00:00.000
                                            String formattedDate =
                                                DateFormat.yMMMMd('en_US')
                                                    .format(pickedDate);
                                            print(formattedDate);
                                            setState(() {
                                              _datecontroller.text =
                                                  formattedDate; //set output date to TextField value.
                                            });
                                          } else {}
                                        }),
                                    const SizedBox(
                                      width: 100,
                                      height: 30,
                                    ),
                                    TextFormField(
                                      controller: _notecontroller,
                                      decoration: const InputDecoration(
                                        icon: Icon(Icons.note_alt),
                                        border: OutlineInputBorder(),
                                        labelText: "Add a Note",
                                      ),
                                      validator: (value){
                                        if(value == null || value.isEmpty)
                                        {
                                          return 'Add a Note !';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      width: 100,
                                      height: 30,
                                    ),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                              style: ButtonStyle(
                                                  foregroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.white),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.blue),
                                                  padding: MaterialStateProperty
                                                      .all<EdgeInsets>(
                                                          EdgeInsets.all(15)),
                                                  shape: MaterialStateProperty
                                                      .all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    // side: BorderSide(color: Colors.red)
                                                  ))),
                                              onPressed: () {
                                                if(_key.currentState!.validate())
                                                  {
                                                    _addnewExpense();
                                                    Navigator.pop(context);
                                                  }
                                              },
                                              child: const Text(
                                                "Add",
                                                style: TextStyle(fontSize: 15),
                                              )),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          TextButton(
                                              style: ButtonStyle(
                                                  foregroundColor:
                                                      MaterialStateProperty.all<Color>(
                                                          Colors.blue),
                                                  padding: MaterialStateProperty
                                                      .all<EdgeInsets>(
                                                          EdgeInsets.all(15)),
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(14.0),
                                                          side: BorderSide(color: Colors.blue)))),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(fontSize: 15),
                                              ))
                                        ])
                                  ],
                                )))));
                  },
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        // side: BorderSide(color: Colors.red)
                      ))),
                  child: const Text(
                    "Add Expense",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
