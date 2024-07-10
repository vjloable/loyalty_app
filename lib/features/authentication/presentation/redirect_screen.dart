import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_app/features/worker/presentation/worker_parent_screen.dart';

import '../../customer/data/customer_repository.dart';
import '../../customer/domain/customer_model.dart';
import '../../customer/presentation/customer_parent_screen.dart';
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
        switch (userModel.permissionLevel) {
          case 0:
            CustomerRepository.getCustomerDoc(userModel.uid).then((customerModel) async {
              if (customerModel == null) {
                Customer customer = CustomerRepository.initialize(userModel.name!, userModel.uid);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerParentScreen(customer: customer,)));
              }
              else {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerParentScreen(customer: customerModel,)));
              }
            });
            break;
          case 1:
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WorkerParentScreen()));
            // CustomerRepository.getCustomerDoc(userModel.uid).then((customerModel) async {
            //   if (customerModel == null) {
            //     CustomerRepository.initialize(userModel.name!, userModel.uid);
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CustomerParentScreen()));
            //   }
            //   else {
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CustomerParentScreen()));
            //   }
            // });
            break;
        }
      }
    }
  }

  void _checkUser() {
    User user = FirebaseAuth.instance.currentUser!;
    UserRepository.getUserDoc(user.uid).then((userModel) async {
      if (userModel == null) {
        UserModel proxyUserModel = UserRepository.initialize(user);
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
