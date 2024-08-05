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
      backgroundColor: Theme.of(context).colorScheme.secondary,
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
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "WakBox",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
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
                              errorStyle: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
                              ),
                              isCollapsed: false,
                              contentPadding: const EdgeInsets.fromLTRB(0, 5, 45, 8),
                              fillColor: Theme.of(context).colorScheme.surface,
                              filled: true,
                              prefixIcon: SizedBox(
                                width: 45,
                                height: 45,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: CustomIcons.email(Theme.of(context).colorScheme.onSecondary),
                                ),
                              ),
                              hintText: 'Email Address',
                              hintStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onSecondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
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
                              errorStyle: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
                              ),
                              isCollapsed: false,
                              contentPadding: const EdgeInsets.fromLTRB(0, 5, 45, 8),
                              fillColor: Theme.of(context).colorScheme.surface,
                              filled: true,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: CustomIcons.password(Theme.of(context).colorScheme.onSecondary),
                              ),
                              hintText: 'Create Password',
                              hintStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onSecondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              errorStyle: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
                              ),
                              isCollapsed: false,
                              contentPadding: const EdgeInsets.fromLTRB(0, 5, 45, 8),
                              fillColor: Theme.of(context).colorScheme.surface,
                              filled: true,
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(15.0),
                              ),
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onSecondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
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
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            minimumSize: const Size(double.infinity, 45),
                            surfaceTintColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            elevation: 4,
                          ),
                          child: isValidatingRegister
                              ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary))
                              : Text("REGISTER", style: TextStyle(color: Theme.of(context).colorScheme.surface, fontSize: 14, fontWeight: FontWeight.w600)),
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(
                              child: Divider(
                                color: Theme.of(context).colorScheme.onSecondary,
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
                                  Text(
                                    'Already have an account?',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.onSecondary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Log in Here',
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.onSecondary,
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
