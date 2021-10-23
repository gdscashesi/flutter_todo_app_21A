

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/utils/helpers/authentication.dart';

class AppState extends ChangeNotifier{
  User? _user;

  User? get user => _user;



  Future<bool> signIn({required BuildContext context,
    required String email,
    required String password}) async {
    _user = await signInWithEmail(context: context, email: email, password: password);
    notifyListeners();
    return isSignedIn();
  }


  Future<bool> signUp({required BuildContext context, required String email, required String password}) async {
    _user = await signUpWithEmail(context: context, email: email, password: password);
    notifyListeners();
    return isSignedIn();
  }



  void signOut(){
    _user = null;
    notifyListeners();
  }



  bool isSignedIn() => _user != null;



}