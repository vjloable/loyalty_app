import 'package:flutter/material.dart';
import 'package:loyalty_app/utils/custom_icons.dart';
import 'package:loyalty_app/utils/illustration_vectors.dart';

class AuthorizedAccessScreen extends StatefulWidget {
  const AuthorizedAccessScreen({super.key});

  @override
  State<AuthorizedAccessScreen> createState() => _AuthorizedAccessScreenState();
}

class _AuthorizedAccessScreenState extends State<AuthorizedAccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IllustrationVectors.authorized_access_hero,
          Column(
            children: [
              Container(
                height: 104,
              ),
              SizedBox(
                height: 84,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SizedBox(
                        height: 26,
                        width: 13,
                        child: CustomIcons.back_arrow,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 60,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Authorized Access",
                      style: TextStyle(
                        color: Color(0xFFFF7373),
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFFFFF),
                        minimumSize: const Size(double.infinity, 50),
                        surfaceTintColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Worker", style: TextStyle(color: Color(0xFF515151), fontSize: 14, fontWeight: FontWeight.w600))
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFFFFF),
                        minimumSize: const Size(double.infinity, 50),
                        surfaceTintColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Manager", style: TextStyle(color: Color(0xFF515151), fontSize: 14, fontWeight: FontWeight.w600))
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFFFFF),
                        minimumSize: const Size(double.infinity, 50),
                        surfaceTintColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Owner", style: TextStyle(color: Color(0xFF515151), fontSize: 14, fontWeight: FontWeight.w600))
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
