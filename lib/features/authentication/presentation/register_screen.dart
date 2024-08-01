import 'package:flutter/material.dart';

import '../../../utils/custom_icons.dart';
import '../application/authentication_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmationPasswordTextEditingController = TextEditingController();

  bool isValidatingRegister = false;

  void showValidationResponse(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Color(0xFFFF7373))),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.none,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 100,
            right: 20,
            left: 20
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF9F9F9),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 60).add(const EdgeInsets.symmetric(horizontal: 30)),
                child: const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "WakBox",
                    style: TextStyle(
                      color: Color(0xFF171717),
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Form(
                    key: _registerFormKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: SizedBox(
                            height: 67,
                            child: Stack(
                              children: [
                                Container(
                                  height: 45,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x20000000),
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
                                  height: 67,
                                  child: TextFormField(
                                    controller: emailTextEditingController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please provide your email address';
                                      }
                                      String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                                      RegExp regex = RegExp(pattern);
                                      if (!regex.hasMatch(value)) {
                                        return 'Please enter a valid email address';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.center,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      errorStyle: const TextStyle(
                                        color: Color(0xFFFF7373),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      errorBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(40)),
                                        borderSide: BorderSide(color: Color(0xFFFF7373)),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(40)),
                                        borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(40)),
                                        borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                                      ),
                                      isCollapsed: false,
                                      contentPadding: const EdgeInsets.fromLTRB(0, 5, 45, 8),
                                      prefixIcon: SizedBox(
                                        width: 45,
                                        height: 45,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: CustomIcons.email,
                                        ),
                                      ),
                                      prefixIconColor: const Color(0xFF515151),
                                      hintText: 'Email Address',
                                      hintStyle: const TextStyle(
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SizedBox(
                            height: 67,
                            child: Stack(
                              children: [
                                Container(
                                  height: 48,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x20000000),
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
                                  height: 67,
                                  child: TextFormField(
                                    controller: passwordTextEditingController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please provide your password';
                                      }
                                      String pattern = r'^[a-zA-Z0-9]{8,}$';
                                      RegExp regex = RegExp(pattern);
                                      if (!regex.hasMatch(value)) {
                                        return 'Please enter at least 8 alphanumeric characters';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.center,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      errorStyle: const TextStyle(
                                        color: Color(0xFFFF7373),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      errorBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(40)),
                                        borderSide: BorderSide(color: Color(0xFFFF7373)),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(40)),
                                        borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(40)),
                                        borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                                      ),
                                      isCollapsed: false,
                                      contentPadding: const EdgeInsets.fromLTRB(0, 5, 45, 5),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: CustomIcons.password,
                                      ),
                                      prefixIconColor: const Color(0xFF515151),
                                      hintText: 'Create Password',
                                      hintStyle: const TextStyle(
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SizedBox(
                            height: 67,
                            child: Stack(
                              children: [
                                Container(
                                  height: 48,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x20000000),
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
                                  height: 67,
                                  child: TextFormField(
                                    controller: confirmationPasswordTextEditingController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return null;
                                      }
                                      if (value != passwordTextEditingController.text && passwordTextEditingController.text.isNotEmpty) {
                                        return 'Please confirm your password correctly';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.center,
                                    obscureText: true,
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
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(40)),
                                        borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                                      ),
                                      isCollapsed: false,
                                      contentPadding: EdgeInsets.fromLTRB(0, 5, 45, 8),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(15.0),
                                      ),
                                      prefixIconColor: Color(0xFF515151),
                                      hintText: 'Confirm Password',
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
                          onPressed: isValidatingRegister ? null : () async {
                            (String, dynamic) validation = ("fail", "");
                            setState(() {
                              isValidatingRegister = true;
                            });
                            if (_registerFormKey.currentState!.validate()) {
                              validation = await AuthenticationService.signUpWithEmailAndPassword(
                                  emailTextEditingController.text,
                                  passwordTextEditingController.text
                              );
                            }
                            if (validation.$1 == "fail" && validation.$2 != "") {
                              showValidationResponse(validation.$2);
                            }
                            setState(() {
                              isValidatingRegister = false;
                            });
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
                          child: isValidatingRegister
                              ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Color(0xFF6590FF)))
                              : const Text("REGISTER", style: TextStyle(color: Color(0xFF515151), fontSize: 14, fontWeight: FontWeight.w600)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(
                              child: Divider(
                                color: Color(0xFF515151),
                                thickness: 0.5,
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  const Text(
                                    'Already have an account?',
                                    style: TextStyle(
                                      color: Color(0xFF515151),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Log in Here',
                                      style: TextStyle(
                                        color: Color(0xFF515151),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              )
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
      ),
    );
  }

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    confirmationPasswordTextEditingController.dispose();
    super.dispose();
  }
}
