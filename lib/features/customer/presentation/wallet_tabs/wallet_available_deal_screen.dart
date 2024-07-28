import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_app/common_widgets/rounded_elevated_button.dart';
import 'package:loyalty_app/utils/custom_icons.dart';

class WalletAvailableDealScreen extends StatefulWidget {
  const WalletAvailableDealScreen({super.key});

  @override
  State<WalletAvailableDealScreen> createState() => _WalletAvailableDealScreenState();
}

class _WalletAvailableDealScreenState extends State<WalletAvailableDealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6590FF),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        borderRadius: BorderRadius.circular(100),
                        child: Ink(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8).add(const EdgeInsets.only(right: 3)),
                            child: CustomIcons.back_arrow_dark,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
              const SizedBox(height: 160),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 45,
                      width: 100,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: DottedBorder(
                        color: const Color(0xFF6590FF),
                        dashPattern: const [4, 4],
                        strokeWidth: 2,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "100 Points",
                              style: TextStyle(
                                color: Color(0xFF6590FF),
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 42,
                      width: double.infinity,
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "Sample Deal Title Sample Deal",
                          style: TextStyle(
                            color: Color(0xFF4E4E4E),
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 25,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 25,
                            width: 25,
                            child: CustomIcons.mini_location,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "Store Name, Location, or Branch",
                            style: TextStyle(
                              color: Color(0xFF4E4E4E),
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 100,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: const Text(
                        "Sample deal description. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
                        style: TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                      width: 100,
                    ),
                    Container(
                      height: 90,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                            child: Text(
                              "Validity",
                              style: TextStyle(
                                color: Color(0xFF4E4E4E),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CustomIcons.mini_time,
                                ),
                                const SizedBox(width: 5),
                                const Expanded(
                                  child: SizedBox(
                                    height: 20,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "4:00 AM - 7:00 PM",
                                        style: TextStyle(
                                          color: Color(0xFF4E4E4E),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CustomIcons.mini_date,
                                ),
                                const SizedBox(width: 5),
                                const Expanded(
                                  child: SizedBox(
                                    height: 20,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Monday - Friday",
                                        style: TextStyle(
                                          color: Color(0xFF4E4E4E),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                            child: Text(
                              "Conditions",
                              style: TextStyle(
                                color: Color(0xFF4E4E4E),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: CustomIcons.mini_check,
                              ),
                              const SizedBox(width: 5),
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 3.5),
                                  child: Text(
                                    "Requires x number of points",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Color(0xFF4E4E4E),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: CustomIcons.mini_check,
                              ),
                              const SizedBox(width: 5),
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 3.5),
                                  child: Text(
                                    "Must be scanned on a specific store location location location location Must be scanned on a specific store location location location location",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Color(0xFF4E4E4E),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAEAEA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                          child: Column(
                            children: [
                              SizedBox(height: 5),
                              SizedBox(
                                height: 20,
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    "How it works?",
                                    style: TextStyle(
                                      color: Color(0xFF4E4E4E),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    "1. Tap the “REDEEM” button to activate your chosen deal.\n2. Present the QR code to be scanned by the store cashier.\n3. Enjoy your hard-earned redeemable.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Color(0xFF4E4E4E),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                      width: 100,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Color(0xFFE2E2E2))),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 28),
            child: RoundedElevatedButton(
              backgroundColor: const Color(0xFF6590FF),
              onPressed: () {},
              child: const Text(
                "REDEEM",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
