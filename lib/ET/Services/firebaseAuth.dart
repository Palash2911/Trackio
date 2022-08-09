import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Users{
  Users({required this.uid});
  final String uid;
}
abstract class AuthClass{
  Future<Users?> currentUser();
  Future<Users?> signIn();
  Future<Users?> createUserEmailAndPwd(String email, String pwd);
  Future<Users?> signInEmail(String email, String pwd);
  Future<void> signOut();
}

class Auth implements AuthClass{
  Users? _userFromFirebase(User user)
  {
    if(user==null)
      {
        return null;
      }
    return Users(uid: user.uid);
  }
  Future<Users?> currentUser() async{
    final user = await FirebaseAuth.instance.currentUser;
    return  _userFromFirebase(user!);
  }
  Future<Users?> signIn() async{
    final auth = await FirebaseAuth.instance.signInAnonymously();
    return _userFromFirebase(auth.user!);
  }
  Future<Users?> signInEmail(String emails, String pwd) async{
    try{
      final auth = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emails, password: pwd);
      // print(auth.user);
      return _userFromFirebase(auth.user!);
    }catch(e)
    {
      print("null");
    }

  }
  Future<Users?> createUserEmailAndPwd(String email, String pwd) async{
    try{
      final auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pwd);
      return _userFromFirebase(auth.user!);
    }catch(e)
    {
      print("null");
    }
  }
  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
  }
}