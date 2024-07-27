import 'package:flutter/material.dart';
import 'package:loyalty_app/features/customer/presentation/wallet_tabs/wallet_available_tab.dart';
import 'package:loyalty_app/features/customer/presentation/wallet_tabs/wallet_owned_tab.dart';
import 'package:loyalty_app/utils/state_handlers.dart';

import '../domain/customer_model.dart';

class CustomerWalletScreen extends StatefulWidget {
  final Customer customer;
  const CustomerWalletScreen({super.key, required this.customer});

  @override
  State<CustomerWalletScreen> createState() => _CustomerWalletScreenState();
}

class _CustomerWalletScreenState extends State<CustomerWalletScreen> {
  TabStateHandler tabStateHandler = TabStateHandler();

  @override
  Widget build(BuildContext context) {
    // Customer customer = widget.customer;
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 130),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: Text(
                  "WALLET",
                  style: TextStyle(
                    color: Color(0xFF4E4E4E),
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 45,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AnimatedBuilder(
                  animation: tabStateHandler,
                  builder: (context, child) {
                    return tabStateHandler.tab == 0 ? Row(
                      children: [
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              tabStateHandler.slideToPage(0);
                            },
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Colors.white,
                            splashFactory: InkSplash.splashFactory,
                            child: Ink(
                              decoration: BoxDecoration(
                                color: const Color(0xFF6590FF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: Center(
                                  child: Text("Available", style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14, fontWeight: FontWeight.w700)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              tabStateHandler.slideToPage(1);
                            },
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Colors.white,
                            splashFactory: InkSplash.splashFactory,
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(0xFF4E4E4E),
                                ),
                              ),
                              child: const SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: Center(
                                  child: Text("Owned", style: TextStyle(color: Color(0xFF4E4E4E), fontSize: 14, fontWeight: FontWeight.w700)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ) : Row(
                      children: [
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              tabStateHandler.slideToPage(0);
                            },
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Colors.white,
                            splashFactory: InkSplash.splashFactory,
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(0xFF4E4E4E),
                                ),
                              ),
                              child: const SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: Center(
                                  child: Text("Available", style: TextStyle(color: Color(0xFF4E4E4E), fontSize: 14, fontWeight: FontWeight.w700)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              tabStateHandler.slideToPage(1);
                            },
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Colors.white,
                            splashFactory: InkSplash.splashFactory,
                            child: Ink(
                              decoration: BoxDecoration(
                                color: const Color(0xFF6590FF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: Center(
                                  child: Text("Owned", style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14, fontWeight: FontWeight.w700)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            AnimatedBuilder(
              animation: tabStateHandler,
              builder: (context, child) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: tabStateHandler.tab == 0
                      ? const WalletAvailableTab()
                      : const WalletOwnedTab(),
                );
              }
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}