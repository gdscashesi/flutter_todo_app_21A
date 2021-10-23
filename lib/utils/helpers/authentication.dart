



import 'package:firebase_auth/firebase_auth.dart';

Future<User?> signInWithEmail({required String email, required String password}) async{
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential credential = await auth.signInWithEmailAndPassword(email: email, password: password);
  return credential.user;
}



Future<User?> signUpWithEmail({required String email, required String password}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential credential = await auth.createUserWithEmailAndPassword(email: email, password: password);

  return credential.user;
}



Future<void> resetPassword(String email) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  auth.sendPasswordResetEmail(email: email);
}

//todo sign out