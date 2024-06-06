import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loyalty_app/features/authentication/presentation/login_screen.dart';
import 'package:loyalty_app/features/authentication/presentation/redirect_screen.dart';

class AuthenticationService{
  static handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData){
            print("Redirecting in");
            return const RedirectScreen();
          } else {
            print("Redirecting out");
            return const LoginScreen();
          }
        }
    );
  }

  static signInWithGoogle() async {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: <String>['email']).signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static signOut() {
    FirebaseAuth.instance.signOut();
  }

  static signUpWithEmailAndPassword(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static signInWithEmailAndPassword(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  static changeDisplayName(User user, String name) async {
    await user.updateDisplayName(name);
  }

  // static linkPass(User? user, String password) async {
  //   await user?.updatePassword(password);
  // }
}
