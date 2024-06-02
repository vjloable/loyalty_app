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
            print("red");
            return const RedirectScreen();
          } else {
            print("reddd");
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
}
