import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  Login({required this.onLogIn});
  final Function(User) onLogIn;

  Future<void> _loginAnonymously() async {
    try {
      await Firebase.initializeApp();
      final auth = await FirebaseAuth.instance.signInAnonymously();
      User? user = FirebaseAuth.instance.currentUser;
      onLogIn(user!);
    } catch (e) {
      print(e.toString());
    }
  }

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
          children: <Widget>[
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
            ButtonTheme(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              minWidth: 280.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: _loginAnonymously,
                child: const Text("Log In", style: TextStyle(fontSize: 18),),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup(),
                        // ));
                      },
                      child: Text("Sign Up")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
