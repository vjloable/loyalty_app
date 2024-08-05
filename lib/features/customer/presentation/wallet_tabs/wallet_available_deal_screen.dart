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
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          fit: StackFit.loose,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const SizedBox(height: 160),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
                            color: Theme.of(context).colorScheme.primary,
                            dashPattern: const [4, 4],
                            strokeWidth: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "100 Points",
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
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
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Sample Deal Title Sample Deal",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSecondary,
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
                                child: CustomIcons.mini_location(Theme.of(context).colorScheme.onSecondary),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Store Name, Location, or Branch",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSecondary,
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
                          child: Text(
                            "Sample deal description. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
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
                              SizedBox(
                                height: 30,
                                child: Text(
                                  "Validity",
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.onSecondary,
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
                                      child: CustomIcons.mini_time(Theme.of(context).colorScheme.onSecondary),
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: SizedBox(
                                        height: 20,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "4:00 AM - 7:00 PM",
                                            style: TextStyle(
                                              color: Theme.of(context).colorScheme.onSecondary,
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
                                      child: CustomIcons.mini_date(Theme.of(context).colorScheme.onSecondary),
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: SizedBox(
                                        height: 20,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Monday - Friday",
                                            style: TextStyle(
                                              color: Theme.of(context).colorScheme.onSecondary,
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
                              SizedBox(
                                height: 30,
                                child: Text(
                                  "Conditions",
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.onSecondary,
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
                                    child: CustomIcons.mini_check(Theme.of(context).colorScheme.onSecondary),
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 3.5),
                                      child: Text(
                                        "Requires x number of points",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Theme.of(context).colorScheme.onSecondary,
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
                                    child: CustomIcons.mini_check(Theme.of(context).colorScheme.onSecondary),
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 3.5),
                                      child: Text(
                                        "Must be scanned on a specific store location location location location Must be scanned on a specific store location location location location",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Theme.of(context).colorScheme.onSecondary,
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
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                              child: Column(
                                children: [
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    height: 20,
                                    width: double.infinity,
                                    child: Center(
                                      child: Text(
                                        "How it works?",
                                        style: TextStyle(
                                          color: Theme.of(context).colorScheme.onSecondary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Center(
                                      child: Text(
                                        "1. Tap the “REDEEM” button to activate your chosen deal.\n2. Present the QR code to be scanned by the store cashier.\n3. Enjoy your hard-earned redeemable.",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Theme.of(context).colorScheme.onSecondary,
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
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    children: [
                      Material(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: BorderSide(color: Theme.of(context).colorScheme.primary),
                        ),
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
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8).add(const EdgeInsets.only(right: 3)),
                              child: CustomIcons.back_arrow(Theme.of(context).colorScheme.onSecondary),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(top: BorderSide(color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.2))),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 28),
            child: RoundedElevatedButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () {},
              child: Text(
                "REDEEM",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
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
