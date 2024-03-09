import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF9F9F9),
      body: Container(
        color: Colors.transparent,
        // color: Colors.yellow,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 135),
              Container(
                color: Colors.transparent,
                // color: Colors.blue,
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: Text(
                    "HOME",
                    style: TextStyle(
                      color: Color(0xFF4E4E4E),
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                // color: Colors.red,
                width: double.infinity,
                height: 235,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Material(
                    color: Colors.white,
                    // color: Colors.green,
                    elevation: 5,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFF0A4400),
                            Color(0xFF1B1B1B),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Flexible(
                          fit: FlexFit.loose,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Discover",
                              style: TextStyle(
                                color: Color(0xFF4E4E4E),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1),
                                child: Text(
                                    '>',
                                    style: TextStyle(
                                      height: 1,
                                      color: Color(0xFF6590FF),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                height: 160,
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Material(
                            color: Colors.white,
                            elevation: 5,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: SizedBox(
                              height: 160,
                              width: 150,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Material(
                            color: Colors.white,
                            elevation: 5,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: SizedBox(
                              height: 150,
                              width: 150,
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.white,
                          elevation: 5,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: SizedBox(
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Flexible(
                          fit: FlexFit.loose,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Earnings",
                              style: TextStyle(
                                color: Color(0xFF4E4E4E),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1),
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                    height: 1,
                                    color: Color(0xFF6590FF),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                width: double.infinity,
                height: 410,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Material(
                    color: Colors.green,
                    elevation: 5,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Container(
                          height: 30,
                          width: double.infinity,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}