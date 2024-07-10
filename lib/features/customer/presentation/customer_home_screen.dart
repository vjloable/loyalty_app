import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

import '../../../utils/cards.dart';
import '../domain/customer_model.dart';
import 'card_tiers_widget.dart';
import 'meter_bar_widget.dart';

class CustomerHomeScreen extends StatefulWidget {
  final Customer customer;
  final Future<void> Function() callback;
  const CustomerHomeScreen({super.key, required this.customer, required this.callback});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  final flipController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    Customer customer = widget.customer;
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
              const SizedBox(
                width: double.infinity,
                child: Padding(
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
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 235,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          flipController.flipcard();
                        },
                        child: FlipCard(
                          animationDuration: const Duration(milliseconds: 300),
                          axis: FlipAxis.vertical,
                          frontWidget: CardTier(card: Cards.white, flipped: false, customer: customer),
                          backWidget: CardTier(card: Cards.white, flipped: true, customer: customer),
                          controller: flipController,
                          rotateSide: RotateSide.left,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 10,
                    height: 235,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Column(
                        children: [
                          SizedBox(width: 30, child: Divider(color: Color(0xFF6590FF), thickness: 3.0)),
                          Text(
                            "FLIP CARD",
                            style: TextStyle(
                              color: Color(0xFF4E4E4E),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "LOYALTY METER:",
                                style: TextStyle(
                                  color: Color(0xFF4E4E4E),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1),
                              child: Text(
                                  'Earn {x} to maintain your status',
                                  style: TextStyle(
                                    height: 1,
                                    color: Color(0xFF4E4E4E),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                            ),
                          ),
                        ],
                      ),
                      MeterBar(value: customer.meter,),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
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
                              "Badges",
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
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    color: const Color(0xFF6590FF),
                    child: SizedBox(
                      height: 135,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "0 of 0 Badges",
                                    style: TextStyle(
                                      color: Color(0xFF4E4E4E),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: const Color(0x266590FF),
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: const Color(0x266590FF),
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: const Color(0x266590FF),
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: const Color(0x266590FF),
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: const Color(0x266590FF),
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
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
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
                              "Get More Points",
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
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFFFFFFF),
                    child: const SizedBox(
                      height: 150,
                      width: double.infinity,
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