import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_app/features/authentication/data/user_repository.dart';
import 'package:loyalty_app/features/customers/data/customer_repository.dart';

import '../../customers/presentation/parent_screen.dart';
import '../application/authentication_service.dart';
import '../domain/user_model.dart';

class CreateDisplayNamePage extends StatefulWidget {
  final UserModel userModel;
  const CreateDisplayNamePage({super.key, required this.userModel});

  @override
  State<CreateDisplayNamePage> createState() => _CreateDisplayNamePageState();
}

class _CreateDisplayNamePageState extends State<CreateDisplayNamePage> {
  final _createDisplayNameFormKey = GlobalKey<FormState>();

  User user = FirebaseAuth.instance.currentUser!;
  TextEditingController displayNameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF9F9F9),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Enter your preferred display name",
                  style: TextStyle(
                    color: Color(0xFF0D0D0D),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    shadows: [
                      Shadow(
                        color: Color(0x40000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Form(
                    key: _createDisplayNameFormKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SizedBox(
                            height: 45,
                            child: Stack(
                              children: [
                                Container(
                                  height: 45,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x40000000),
                                      ),
                                      BoxShadow(
                                        color: Color(0xFFFBFBFB),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.all(Radius.circular(40)),
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    controller: displayNameTextEditingController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please provide a display name';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.center,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      errorStyle: TextStyle(
                                        color: Color(0xFFFF7373),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(40)),
                                        borderSide: BorderSide(color: Color(0xFFFF7373)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(40)),
                                        borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                                      ),
                                      isCollapsed: false,
                                      hintText: 'Display Name',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF858585),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_createDisplayNameFormKey.currentState!.validate()) {
                              AuthenticationService.changeDisplayName(user, displayNameTextEditingController.text);
                              UserRepository.setUserDocName(widget.userModel, displayNameTextEditingController.text);
                              CustomerRepository.setName(user, displayNameTextEditingController.text);
                              Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ParentScreen()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFFFFF),
                            minimumSize: const Size(double.infinity, 45),
                            surfaceTintColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                                side: const BorderSide(color: Color(0xFFE2E2E2))
                            ),
                            elevation: 4,
                          ),
                          child: const Text(
                            "SUBMIT",
                            style: TextStyle(
                              color: Color(0xFF515151),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
