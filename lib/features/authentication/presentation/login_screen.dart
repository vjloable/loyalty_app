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
                padding: EdgeInsets.only(bottom: 100),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Otter Bell",
                    style: TextStyle(
                      color: Color(0xFF0D0D0D),
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
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
                                      isCollapsed: false,
                                      contentPadding: const EdgeInsets.fromLTRB(0, 5, 45, 8),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: CustomIcons.password,
                                      ),
                                      prefixIconColor: const Color(0xFF515151),
                                      hintText: 'Password',
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
                            width: double.infinity,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {}, //TODO: Add forgot password function
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: Color(0xFF515151),
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
                            backgroundColor: const Color(0xFFFFFFFF),
                            minimumSize: const Size(double.infinity, 45),
                            surfaceTintColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: const BorderSide(color: Color(0xFFE2E2E2))
                            ),
                            elevation: 4,
                          ),
                          child: isValidatingLogin
                              ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Color(0xFF6590FF)))
                              : const Text("LOG IN", style: TextStyle(color: Color(0xFF515151), fontSize: 14, fontWeight: FontWeight.w600))
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
                          const Text(
                            'Don’t have an account yet?',
                            style: TextStyle(
                              color: Color(0xFF515151),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                            },
                            child: const Text(
                              'Register Here',
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
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                      child: Row(
                        children: [
                          Flexible(
                            child: Divider(
                              color: Color(0xFF515151),
                              thickness: 0.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                color: Color(0xFF515151),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Divider(
                              color: Color(0xFF515151),
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
                          onPressed: () {}, // TODO: add Facebook authentication
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
                          onPressed: () {}, // TODO: add X authentication
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
