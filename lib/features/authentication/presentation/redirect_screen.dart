import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../customers/data/customer_repository.dart';
import '../../customers/presentation/parent_screen.dart';
import '../data/user_repository.dart';
import '../domain/user_model.dart';
import 'create_display_name_page.dart';

class RedirectScreen extends StatefulWidget {
  const RedirectScreen({super.key});

  @override
  State<RedirectScreen> createState() => _RedirectScreenState();
}

class _RedirectScreenState extends State<RedirectScreen> {
  void _goToRedirection(UserModel userModel) {
    if (userModel.isLocked) {
      //TODO: Add a account locked screen
    } else {
      if (userModel.name == null) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateDisplayNamePage(userModel: userModel)));
      } else {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ParentScreen()));
      }
    }
  }

  void _checkUser() {
    User user = FirebaseAuth.instance.currentUser!;
    UserRepository.getUserDoc(user).then((userModel) async {
      if (userModel == null) {
        UserModel proxyUserModel = UserRepository.initialize(user);
        CustomerRepository.initialize(user);
        _goToRedirection(proxyUserModel);
      }
      else {
        _goToRedirection(userModel);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _checkUser();
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
