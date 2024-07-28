import 'package:flutter/material.dart';
import 'package:loyalty_app/common_widgets/deal_card_widget.dart';
import 'package:loyalty_app/features/customer/presentation/wallet_tabs/wallet_available_deal_screen.dart';

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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: DealCardWidget(destination: WalletAvailableDealScreen()),
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
