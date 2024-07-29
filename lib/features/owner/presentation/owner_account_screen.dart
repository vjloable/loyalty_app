import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/flip_switch_widget.dart';
import '../../../common_widgets/tappable_item_widget.dart';
import '../../../main.dart';
import '../../../utils/custom_icons.dart';
import '../../../utils/state_handlers.dart';
import '../../authentication/application/authentication_service.dart';
import '../../authentication/data/user_repository.dart';
import '../../authentication/domain/user_model.dart';
import '../../authentication/presentation/authorized_access_screen.dart';
import '../domain/owner_model.dart';

class OwnerAccountScreen extends StatefulWidget {
  final Owner owner;
  const OwnerAccountScreen({super.key, required this.owner,});

  @override
  State<OwnerAccountScreen> createState() => _OwnerAccountScreenState();
}

class _OwnerAccountScreenState extends State<OwnerAccountScreen> {
  User user = FirebaseAuth.instance.currentUser!;
  FlipSwitchStateHandler flipSwitchStateHandler = FlipSwitchStateHandler();

  @override
  void initState() {
    flipSwitchStateHandler.setFlipState(MyApp.themeNotifier.value == ThemeMode.dark);
    super.initState();
  }

  Widget _showIfAuthorized(AsyncSnapshot<GenericUser?> snapshot){
    if (snapshot.hasData) {
      GenericUser userModel = snapshot.data!;
      return userModel.permissionMax > 0 ? TappableItem(
        icon: CustomIcons.authorized_access(Theme.of(context).colorScheme.error),
        text: "Authorized Access",
        backgroundColor: Theme.of(context).colorScheme.onError,
        tappedColor: Theme.of(context).colorScheme.error.withOpacity(0.3),
        textColor: Theme.of(context).colorScheme.error,
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => AuthorizedAccessScreen(userModel: userModel,),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = const Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        },
      ) : Container();
    } else {
      return Container();
    }
  }

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
                widget.owner.name ?? "",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "PREFERENCE",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                TappableItem(
                  icon: CustomIcons.dark_mode(Theme.of(context).colorScheme.onSecondary),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  text: "Dark Mode",
                  onTap: null,
                  child: FlipSwitch(
                    flipSwitchStateHandler: flipSwitchStateHandler,
                    onTap: () {
                      flipSwitchStateHandler.flipTheSwitch();
                      MyApp.themeNotifier.value = flipSwitchStateHandler.getFlipState ? ThemeMode.dark : ThemeMode.light;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 219,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 35,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "ACCOUNT",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      TappableItem(
                        icon: CustomIcons.user_profile(Theme.of(context).colorScheme.onSecondary),
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        text: "User Profile",
                        onTap: () {},
                      ),
                      TappableItem(
                        icon: CustomIcons.security(Theme.of(context).colorScheme.onSecondary),
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        text: "Security",
                        onTap: () {},
                      ),
                      TappableItem(
                        icon: CustomIcons.link_to_socials(Theme.of(context).colorScheme.onSecondary),
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        text: "Link to Socials",
                        onTap: () {},
                      ),
                      FutureBuilder(
                        future: UserRepository.getUserDoc(widget.owner.uid),
                        builder: (context, snapshot) {
                          return AnimatedSwitcher(
                            duration: const Duration(seconds: 1),
                            child: _showIfAuthorized(snapshot),
                          );
                        },
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
              child: Text(
                "LOGOUT",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
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

  @override
  void dispose() {
    flipSwitchStateHandler.dispose();
    super.dispose();
  }
}