import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_app/features/manager/data/manager_repository.dart';
import 'package:loyalty_app/features/owner/data/owner_repository.dart';
import 'package:loyalty_app/features/owner/presentation/owner_parent_screen.dart';
import 'package:loyalty_app/features/worker/data/worker_repository.dart';
import 'package:loyalty_app/features/worker/presentation/worker_parent_screen.dart';

import '../../customer/data/customer_repository.dart';
import '../../customer/domain/customer_model.dart';
import '../../customer/presentation/customer_parent_screen.dart';
import '../../manager/domain/manager_model.dart';
import '../../manager/presentation/manager_parent_screen.dart';
import '../../owner/domain/owner_model.dart';
import '../../worker/domain/worker_model.dart';
import '../data/user_repository.dart';
import '../domain/user_model.dart';

class RedirectScreen extends StatefulWidget {
  const RedirectScreen({super.key});

  @override
  State<RedirectScreen> createState() => _RedirectScreenState();
}

class _RedirectScreenState extends State<RedirectScreen> {
  void _goToRedirection(GenericUser userModel) {
    if (userModel.isLocked) {
      //TODO: Add a account locked screen
    } else {
      switch (userModel.permissionLevel) {
        case 0:
          CustomerRepository.getCustomerDoc(userModel.uid).then((customerModel) async {
            if (customerModel == null) {
              Customer customer = CustomerRepository.initialize((userModel.name == null) ? userModel.uid : userModel.name!, userModel.uid);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerParentScreen(customer: customer)));
            }
            else {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerParentScreen(customer: customerModel)));
            }
          });
          break;
        case 1:
          WorkerRepository.getWorkerDoc(userModel.uid).then((workerModel) async {
            if (workerModel == null) {
              Worker worker = WorkerRepository.initialize(userModel.name!, userModel.uid);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkerParentScreen(worker: worker)));
            }
            else {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkerParentScreen(worker: workerModel)));
            }
          });
          break;
        case 2:
          ManagerRepository.getManagerDoc(userModel.uid).then((managerModel) async {
            if (managerModel == null) {
              Manager manager = ManagerRepository.initialize(userModel.name!, userModel.uid);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ManagerParentScreen(manager: manager)));
            }
            else {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ManagerParentScreen(manager: managerModel)));
            }
          });
          break;
        case 3:
          OwnerRepository.getOwnerDoc(userModel.uid).then((ownerModel) async {
            if (ownerModel == null) {
              Owner owner = OwnerRepository.initialize(userModel.name!, userModel.uid);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OwnerParentScreen(owner: owner)));
            }
            else {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OwnerParentScreen(owner: ownerModel)));
            }
          });
          break;
      }
    }
  }

  void _checkUser() {
    User user = FirebaseAuth.instance.currentUser!;
    UserRepository.getUserDoc(user.uid).then((userModel) async {
      if (userModel == null) {
        GenericUser proxyUserModel = UserRepository.initialize(user);
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
            value: null,
          ),
        ),
      ),
    );
  }
}
