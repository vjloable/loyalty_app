import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_app/common_widgets/tappable_item_widget.dart';
import 'package:loyalty_app/features/authentication/application/authentication_service.dart';
import 'package:loyalty_app/utils/custom_icons.dart';

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
            SizedBox(
              height: 30,
              child: Text(
                user.displayName??"",
                style: const TextStyle(
                  color: Color(0xFF4E4E4E),
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
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
                TappableItem(icon: CustomIcons.dark_mode, text: "Dark Mode", onTap: () {}),
              ],
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
                      TappableItem(icon: CustomIcons.user_profile, text: "User Profile", onTap: () {}),
                      TappableItem(icon: CustomIcons.security, text: "Security", onTap: () {}),
                      TappableItem(icon: CustomIcons.link_to_socials, text: "Link to Socials", onTap: () {}),
                      TappableItem(
                        icon: CustomIcons.authorized_access,
                        text: "Authorized Access",
                        backgroundColor: const Color(0xFFFFEFEF),
                        tappedColor: const Color(0xFFFF7373).withOpacity(0.3),
                        textColor: const Color(0xFFFF7373),
                        onTap: () {},
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