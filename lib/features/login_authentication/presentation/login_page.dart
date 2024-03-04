
import 'package:flutter/material.dart';
import 'package:loyalty_app/constants/vector_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    "Loyalty App",
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
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
                            borderRadius: BorderRadius.all(Radius.circular(40))
                          ),
                          child: const TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                              ),
                              isCollapsed: false,
                              contentPadding: EdgeInsets.fromLTRB(0, 5, 45, 5),
                              prefixIcon: Icon(Icons.email_outlined),
                              prefixIconColor: Color(0xFF515151),
                              hintText: 'Email Address',
                              hintStyle: TextStyle(
                                color: Color(0xFF858585),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
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
                          child: const TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                              ),
                              isCollapsed: false,
                              contentPadding: EdgeInsets.fromLTRB(0, 5, 45, 5),
                              prefixIcon: Icon(Icons.lock_outlined),
                              prefixIconColor: Color(0xFF515151),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Color(0xFF858585),
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
                        onPressed: () {},
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
                          "LOG IN",
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
                            onTap: () {}, //TODO: Add register function
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
                          onPressed: () {}, // TODO: add Google authentication
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: EdgeInsets.zero,
                            backgroundColor: const Color(0xFFFFFFFF),
                            surfaceTintColor: Colors.transparent,
                            elevation: 4,
                          ),
                          child: VectorIcons.google,
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
                          child: VectorIcons.facebook,
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
                          child: VectorIcons.x,
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
}
