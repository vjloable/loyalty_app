import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_app/features/authentication/presentation/create_display_name_page.dart';
import 'package:loyalty_app/features/customers/presentation/parent_screen.dart';

class RedirectScreen extends StatefulWidget {
  const RedirectScreen({super.key});

  @override
  State<RedirectScreen> createState() => _RedirectScreenState();
}

class _RedirectScreenState extends State<RedirectScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  void _checkUserAccount() {
    User user = FirebaseAuth.instance.currentUser!;
    var serverTimestamp = FieldValue.serverTimestamp();
    final userDocRef = _firebaseFirestore.collection("users").doc(user.uid);
    userDocRef.get().then((userId) async {
      //Checks if a certain User ID is in the "user" collection
      if (!userId.exists) {
        final userData = {
          "creation": serverTimestamp,
          "email": user.email,
          "uid": user.uid,
          "name": user.displayName,
          "permissions": 0,
          "isLocked": false,
        };
        _firebaseFirestore
            .collection("users")
            .doc(user.uid)
            .set(userData, SetOptions(merge: true))
            .then((_) {
          print("Successfully added user id");
        }).onError((error, stackTrace) {
          print("Error adding user id");
        });
      }

      userDocRef.get().then((value) {
        var accParameters = (value.data() as Map<String, dynamic>);
        int permissions = accParameters["permissions"];
        bool isLocked = accParameters["isLocked"];
        bool hasNoDisplayName = accParameters["name"] == null;
        if (isLocked) {

        } else {
          if (hasNoDisplayName) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateDisplayNamePage(userDocReference: userDocRef)));
          } else {
            switch (permissions) {
              case 0:
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ParentScreen()));
                break;
            }
          }
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _checkUserAccount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(
            color: Color(0xFF6590FF),
            value: null,
          ),
        ),
      ),
    );
  }
}
