

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/utils/helpers/authentication.dart';
import 'package:todo/utils/providers/task_list.dart';

class AppState extends ChangeNotifier{
  User? _user;
  late TaskList taskList;

  AppState(){
    taskList = TaskList();
  }


  User? get user => _user;
  // List<Task> get tasks => _tasks;
  // int get taskCount => _tasks.length;


  //==========Auth methods ============================
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