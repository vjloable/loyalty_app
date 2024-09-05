import 'package:flutter/material.dart';
import 'package:loyalty_app/features/customer/presentation/wallet_tabs/wallet_available_deal_screen.dart';

import '../../../../common_widgets/deal_card_widget.dart';
import '../../../../utils/graphics.dart';

class WalletOwnedTab extends StatefulWidget {
  final bool isDisable;
  const WalletOwnedTab({super.key, required this.isDisable});

  @override
  State<WalletOwnedTab> createState() => _WalletOwnedTabState();
}

class _WalletOwnedTabState extends State<WalletOwnedTab> {
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
                        "Owned",
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: DealCardWidget(
            destination: WalletAvailableDealScreen(isDisable: widget.isDisable),
            hasButtons: true,
          ),
        ),
        SizedBox(
          height: 200,
          child: Illustration.no_owned_deals,
        ),
        const SizedBox(
          height: 30,
          child: Text(
            "You do not own any deals yet.",
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
