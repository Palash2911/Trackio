import 'package:expense_tracker/ET/Services/firebaseAuth.dart';
import 'package:expense_tracker/ET/Sign_Up/login_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:expense_tracker/firebase_options.dart';
import 'package:expense_tracker/ET/Sign_Up/signup_layout.dart';

class Signup extends StatefulWidget {
  // const Signup({Key? key}) : super(key: key);
  Signup({required this.auth});
  // final Function(User) onSignIn;
  final AuthClass auth;

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final TextEditingController _emailnew = TextEditingController();
  final TextEditingController _pwdnew = TextEditingController();
  String get _email => _emailnew.text;
  String get _pwd => _pwdnew.text;

  Future<void> _signInAnonymously() async {
    try {
      await Firebase.initializeApp();
      final auth = await FirebaseAuth.instance.signInAnonymously();
      // onSignIn(auth.user!);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIGN UP',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Your Name",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Your Email-ID",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Your Monthly Budget (in Rs. )",
                ),
              ),
            ),
            ButtonTheme(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              minWidth: 280.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: _signInAnonymously,
                child: const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    "Already have an account ? ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => Login(onLogIn: onLogIn)
                        // ));
                      },
                      child: Text("Log In")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
