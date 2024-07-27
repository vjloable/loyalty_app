import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:loyalty_app/common_widgets/rounded_elevated_button.dart';
import 'package:loyalty_app/features/worker/presentation/scanner/scan_capture_screen.dart';

import '../domain/manager_model.dart';


class ManagerHomeScreen extends StatefulWidget {
  final Manager manager;
  final Future<void> Function() callback;
  const ManagerHomeScreen({super.key, required this.manager, required this.callback,});

  @override
  State<ManagerHomeScreen> createState() => _ManagerHomeScreenState();
}

class _ManagerHomeScreenState extends State<ManagerHomeScreen> {
  final flipController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RefreshIndicator(
        onRefresh: widget.callback,
        displacement: 40,
        edgeOffset: 40,
        color: const Color(0xFF6590FF),
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 135),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "MANAGER",
                          style: TextStyle(
                            color: Color(0xFF4E4E4E),
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "( ${widget.manager.branches??"Unassigned"} )",
                          style: const TextStyle(
                            color: Color(0xFF4E4E4E),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.manager.name??"",
                      style: const TextStyle(
                        color: Color(0xFF4E4E4E),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Actions",
                            style: TextStyle(
                              color: Color(0xFF4E4E4E),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: RoundedElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScanScreen(),));
                      },
                      backgroundColor: const Color(0xFFFFFFFF),
                      child: const Text("SCAN", style: TextStyle(color: Color(0xFF515151), fontSize: 14, fontWeight: FontWeight.w700)),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: RoundedElevatedButton(
                      onPressed: () {},
                      backgroundColor: const Color(0xFFFFFFFF),
                      child: const Text("GIFT", style: TextStyle(color: Color(0xFF515151), fontSize: 14, fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Manage",
                            style: TextStyle(
                              color: Color(0xFF4E4E4E),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  RoundedElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScanScreen(),));
                    },
                    backgroundColor: const Color(0xFFFFFFFF),
                    child: const Text("SCAN", style: TextStyle(color: Color(0xFF515151), fontSize: 14, fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 10),
                  RoundedElevatedButton(
                    onPressed: () {},
                    backgroundColor: const Color(0xFFFFFFFF),
                    child: const Text("GIFT", style: TextStyle(color: Color(0xFF515151), fontSize: 14, fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}