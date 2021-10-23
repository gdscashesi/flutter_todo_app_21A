

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/utils/helpers/authentication.dart';

class AppState extends ChangeNotifier{
  User? _user;

  User? get user => _user;



  Future<bool> signIn({required String email, required String password}) async {
    _user = await signInWithEmail(email: email, password: password);
    notifyListeners();
    return isSignedIn();
  }


  Future<bool> signUp({required String email, required String password}) async {
    _user = await signUpWithEmail(email: email, password: password);
    notifyListeners();
    return isSignedIn();
  }



  void signOut(){
    _user = null;
    notifyListeners();
  }



  bool isSignedIn() => _user != null;



}