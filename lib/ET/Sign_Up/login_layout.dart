import 'package:expense_tracker/ET/Sign_Up/signup_layout.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOG IN', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Your Email-ID",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Your Password",
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text("Don't have an account ? ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: TextButton(style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                  ),onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup(),));
                  }, child: Text("Sign Up")),
                )
              ],
            )
          ],
        ),

      ),
    );
  }
}
