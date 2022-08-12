import 'package:expense_tracker/ET/Services/firebaseAuth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({required this.auth, required this.onLogIn});
  final Function(Users?) onLogIn;
  final AuthClass auth;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> _loginAnonymously() async {
    try {
      await Firebase.initializeApp();
      Users? user = await widget.auth.signIn();
      // onLogIn(user!);
    } catch (e) {
      print(e.toString());
    }
  }

  bool checker = false;
  bool signuplogin = false;
  bool validate = false;

  final TextEditingController _emailcontrol = TextEditingController();
  final TextEditingController _pwdcontrol = TextEditingController();
  final TextEditingController _namecontrol = TextEditingController();
  final TextEditingController _budgetcontrol = TextEditingController();
  String get _email => _emailcontrol.text;
  String get _pwd => _pwdcontrol.text;
  String get _name => _namecontrol.text;
  String get _budget => _budgetcontrol.text;

  void _signuplogin() {
    setState(() {
      signuplogin = !signuplogin;
    });
  }

  void _loginbtn() async {
    if (signuplogin == false) {
      Users? user = await widget.auth.signInEmail(_email, _pwd);
      if (user == null) {
        setState(() {
          checker = true;
        });
      }
      widget.onLogIn(user!);
    } else {
      Users? user =
          await widget.auth.createUserEmailAndPwd(_email, _pwd, _name, _budget);
      if (user == null) {
        setState(() {
          checker = true;
        });
      }
      widget.onLogIn(user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOG IN', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: !signuplogin? const EdgeInsets.only(top: 130.0): EdgeInsets.only(top: 50),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // checker==true?Text(""):(Text('wish')),
            signuplogin
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    child: TextField(
                      controller: _namecontrol,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Name",
                        hintText: "John Smith",
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: TextField(
                controller: _emailcontrol,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Email",
                  hintText: "John@gmail.com",
                  // errorText: _validator(_emailcontrol.text.toString()) ? null : "Email can't be empty",
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: TextField(
                controller: _pwdcontrol,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Password",
                  // errorText: _validator(_pwd) ? null : "Password can't be empty"
                ),
                textInputAction: TextInputAction.done,
              ),
            ),
            signuplogin
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    child: TextField(
                      controller: _budgetcontrol,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Monthly Budget (in Rs. )",
                        hintText: "1000",
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
            ButtonTheme(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              minWidth: 280.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: () => _loginbtn(),
                child: !signuplogin
                    ? Text(
                        "Log In",
                        style: TextStyle(fontSize: 18),
                      )
                    : Text(
                        "Create Account",
                        style: TextStyle(fontSize: 18),
                      ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: !signuplogin
                      ? const Text(
                          "Don't have an account ? ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      : Text(
                          "Already have an account ? ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      onPressed: _signuplogin,
                      child: !signuplogin ? Text("Sign Up") : Text("Login")),
                )
              ],
            )
          ],
        ),
      ),
      ),
    );
  }
}
