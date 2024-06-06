import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_app/features/authentication/authentication_service.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  User user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 135),
            const SizedBox(
              width: 90,
              height: 90,
              child: CircleAvatar(radius: 45, backgroundColor: Color(0x266590FF)),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              height: 30,
              child: Text(
                "Display Name",
                style: TextStyle(
                  color: Color(0xFF4E4E4E),
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 84,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 35,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "PREFERENCE",
                          style: TextStyle(
                            color: Color(0xFF4E4E4E),
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 46,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border(bottom: BorderSide(color: Color(0x80959595)))
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 40, height: 40, child: Placeholder()),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Dark Mode",
                              style: TextStyle(
                                color: Color(0xFF4E4E4E),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 219,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 35,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "ACCOUNT",
                          style: TextStyle(
                            color: Color(0xFF4E4E4E),
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 46,
                        decoration: const BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            border: Border(bottom: BorderSide(color: Color(0x80959595)))
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 40, height: 40, child: Placeholder()),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "User Profile",
                                  style: TextStyle(
                                    color: Color(0xFF4E4E4E),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 46,
                        decoration: const BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            border: Border(bottom: BorderSide(color: Color(0x80959595)))
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 40, height: 40, child: Placeholder()),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Security",
                                  style: TextStyle(
                                    color: Color(0xFF4E4E4E),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 46,
                        decoration: const BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            border: Border(bottom: BorderSide(color: Color(0x80959595)))
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 40, height: 40, child: Placeholder()),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Link to Socials",
                                  style: TextStyle(
                                    color: Color(0xFF4E4E4E),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 46,
                        decoration: const BoxDecoration(
                            color: Color(0xFFFFEFEF),
                            border: Border(bottom: BorderSide(color: Color(0x80959595)))
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 40, height: 40, child: Placeholder()),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Authorized Access",
                                  style: TextStyle(
                                    color: Color(0xFFFF7373),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                AuthenticationService.signOut();
                Navigator.pop(context);
              },
              child: const Text(
                "LOGOUT",
                style: TextStyle(
                  color: Color(0xFF6590FF),
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}