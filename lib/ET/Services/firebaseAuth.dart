import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Users{
  Users({required this.uid});
  final String uid;
}
abstract class AuthClass{
  Future<Users?> currentUser();
  Future<Users?> signIn();
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
  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
  }
}