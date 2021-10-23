import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<User?> signInWithEmail(
    {required BuildContext context,
    required String email,
    required String password}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    UserCredential credential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return credential.user;
  } on FirebaseAuthException catch (e) {
    authErrorPopUp(e.code, context);
  }
}

Future<User?> signUpWithEmail(
    {required BuildContext context,
    required String email,
    required String password}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    return credential.user;
  } on FirebaseAuthException catch (e) {
    authErrorPopUp(e.code, context);
  }
}

Future<void> resetPassword(String email) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  auth.sendPasswordResetEmail(email: email);
}

//todo sign out

//=============================== Authentication Error handling
void authErrorPopUp(String code, BuildContext context) {
  SnackBar snap(String text) {
    return SnackBar(
        backgroundColor: Colors.red,
        content: Text(text)
    );
  }

  switch (code) {
    case "wrong-password":
      ScaffoldMessenger.of(context)
          .showSnackBar(snap("Wrong password"));
      break;
    case "user-not-found":
      ScaffoldMessenger.of(context)
          .showSnackBar(snap("No account exists for the email"));
      break;
    case "email-already-in-use":
      ScaffoldMessenger.of(context)
          .showSnackBar(snap("You already have an account"));
      break;
    case "invalid-email":
      ScaffoldMessenger.of(context)
          .showSnackBar(snap("This is not a valid email"));
      break;
    case "weak-password":
      ScaffoldMessenger.of(context)
          .showSnackBar(snap("Your password is too weak"));
  }
}
