import 'package:flutter/material.dart';
import 'package:loyalty_app/features/authentication/presentation/register_screen.dart';

import '../../../utils/custom_icons.dart';
import '../../../utils/federated_icons.dart';
import '../application/authentication_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  bool isValidatingLogin = false;

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
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SizedBox(
                            height: 67,
                            child: TextFormField(
                              controller: emailTextEditingController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please provide your email address';
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SizedBox(
                            height: 67,
                            child: TextFormField(
                              controller: passwordTextEditingController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please provide your password';
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
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.onSecondary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {}, //TODO: Add forgot password function
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.onSecondary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: isValidatingLogin ? null : () async {
                            (String, dynamic) validation = ("fail", "");
                            setState(() {
                              isValidatingLogin = true;
                            });
                            if (_loginFormKey.currentState!.validate()) {
                              validation = await AuthenticationService.signInWithEmailAndPassword(
                                  emailTextEditingController.text,
                                  passwordTextEditingController.text
                              );
                            }
                            if (validation.$1 == "fail" && validation.$2 != "") {
                              showValidationResponse(validation.$2);
                            }
                            setState(() {
                              isValidatingLogin = false;
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
                          child: isValidatingLogin
                              ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Theme.of(context).colorScheme.surface))
                              : Text("LOG IN", style: TextStyle(color: Theme.of(context).colorScheme.surface, fontSize: 14, fontWeight: FontWeight.w600))
                        ),
                      ],
                    ),
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
                            'Don’t have an account yet?',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                            },
                            child: Text(
                              'Register Here',
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
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                      child: Row(
                        children: [
                          Flexible(
                            child: Divider(
                              color: Theme.of(context).colorScheme.onSecondary,
                              thickness: 0.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSecondary,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Divider(
                              color: Theme.of(context).colorScheme.onSecondary,
                              thickness: 0.5,
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            AuthenticationService.signInWithGoogle();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: EdgeInsets.zero,
                            backgroundColor: const Color(0xFFFFFFFF),
                            surfaceTintColor: Colors.transparent,
                            elevation: 4,
                          ),
                          child: FederatedIcons.google,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: EdgeInsets.zero,
                            backgroundColor: const Color(0xFF225DB6),
                            surfaceTintColor: Colors.transparent,
                            elevation: 4,
                          ),
                          child: FederatedIcons.facebook,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: EdgeInsets.zero,
                            backgroundColor: const Color(0xFF0D0D0D),
                            surfaceTintColor: Colors.transparent,
                            elevation: 4,
                          ),
                          child: FederatedIcons.x,
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
    super.dispose();
  }
}
