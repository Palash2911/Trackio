import 'package:expense_tracker/ET/Services/firebaseAuth.dart';
import 'package:expense_tracker/ET/Sign_Up/signup_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  bool _validator(String value){
    print(value);
    return value.isNotEmpty;
  }

  bool checker = false;

  final TextEditingController _emailcontrol = TextEditingController();

  final TextEditingController _pwdcontrol = TextEditingController();

  String get _email => _emailcontrol.text;

  String get _pwd => _pwdcontrol.text;

  void _signinEmail(BuildContext context)
  {
    //TODO
  }

  void _loginbtn() async {
        Users? user = await widget.auth.signInEmail(_email, _pwd);
        if(user==null)
          {
            setState(() {
              checker = !checker;
            });
          }
        widget.onLogIn(user!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOG IN', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          checker==true?Text(""):(Text('wish')),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: TextField(
              controller: _emailcontrol,
              decoration:  InputDecoration(
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
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Password",
                // errorText: _validator(_pwd) ? null : "Password can't be empty"
              ),
              textInputAction: TextInputAction.done,
            ),
          ),
          ButtonTheme(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            minWidth: 280.0,
            child: RaisedButton(
              textColor: Colors.white,
              onPressed: () => _loginbtn(),
              child: const Text("Log In", style: TextStyle(fontSize: 18),),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: Text(
                  "Don't have an account ? ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    onPressed: () {},
                    child: Text("Sign Up")),
              )
            ],
          )
        ],
      ),
    );
  }
}
