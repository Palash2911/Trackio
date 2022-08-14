import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Users{
  Users({required this.uid});
  final String uid;
}
abstract class AuthClass{
  Future<Users?> currentUser();
  Future<Users?> signIn();
  Future<Users?> createUserEmailAndPwd(String email, String pwd, String Name, String Budget);
  Future<Users?> signInEmail(String email, String pwd);
  Future<int> newexpense(String amt, String date, String category);
  Future<int> getexpense();
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
      print(e);
    }
  }

  Future<Users?> createUserEmailAndPwd(String email, String pwd, String Name, String Budget) async{
    try{
      final auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pwd);
      CollectionReference users = FirebaseFirestore.instance.collection('Users');
      print(auth.user?.uid.toString());
      users.doc(auth.user?.uid).set({'Name': Name, 'Email': email, 'Monthly Budget': Budget, 'Monthly Spent':  0, 'UserID': auth.user?.uid.toString()});
      return _userFromFirebase(auth.user!);
    }catch(e)
    {
      print(e);
    }
  }

  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
  }

  Future<int> newexpense(String amt, String date, String category) async{
    try{
      int spent=int.parse(amt);
      int sp, totAmt = 0;
      final auth = await FirebaseAuth.instance.currentUser;
      CollectionReference users = FirebaseFirestore.instance.collection('Users');
      users.get().then((QuerySnapshot querys) {
        for (var doc in querys.docs) {
          // print(doc["Monthly Spent"]);
          if(doc.id.toString() == auth?.uid.toString())
            {
              sp = int.parse(doc["Monthly Spent"].toString());
              totAmt = int.parse(doc["Monthly Budget"]);
              sp+=spent;
              users.doc(auth?.uid).update({"Monthly Spent": (sp)});
              break;
            }
           }
      });
      users.doc(auth?.uid).collection('History').add({"Spent" : amt, "Date": date, "Category": category});
      return totAmt;
    }catch(e)
    {
      print(e.toString());
    }
    return 0;
  }
  
  Future<int> getexpense() async{
    final auth = await FirebaseAuth.instance.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    int totAmt = 0;
    users.get().then((QuerySnapshot query) {
      for (var doc in query.docs) {
        // print(doc["Monthly Spent"]);
        if(doc.id.toString() == auth?.uid.toString())
        {
          totAmt = int.parse(doc["Monthly Budget"]);
          break;
        }
      }
    });
    return totAmt;
  }
}