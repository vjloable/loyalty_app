import 'package:flutter/material.dart';

import '../../../../utils/graphics.dart';

class WalletAvailableTab extends StatefulWidget {
  const WalletAvailableTab({super.key});

  @override
  State<WalletAvailableTab> createState() => _WalletAvailableTabState();
}

class _WalletAvailableTabState extends State<WalletAvailableTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Available",
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
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
        //   child: SizedBox(
        //     height: 100,
        //     child: Flexible(
        //       child: InkWell(
        //         onTap: () {
        //
        //         },
        //         borderRadius: BorderRadius.circular(20),
        //         splashColor: Colors.white,
        //         splashFactory: InkSplash.splashFactory,
        //         child: Ink(
        //           decoration: BoxDecoration(
        //             color: const Color(0xFF6590FF),
        //             borderRadius: BorderRadius.circular(20),
        //           ),
        //           child: const SizedBox(
        //             height: 45,
        //             width: double.infinity,
        //             child: Center(
        //               child: Text("Available", style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14, fontWeight: FontWeight.w700)),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(40),
            elevation: 4,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Ink(
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    ),
                  ),
                  Ink(
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: Illustration.no_available_deals,
        ),
        const SizedBox(
          height: 30,
          child: Text(
            "There are no deals available.",
            style: TextStyle(
              color: Color(0xFF4E4E4E),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
