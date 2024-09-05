import 'package:flutter/material.dart';
import 'package:loyalty_app/features/customer/presentation/wallet_tabs/wallet_available_tab.dart';
import 'package:loyalty_app/features/customer/presentation/wallet_tabs/wallet_owned_tab.dart';
import 'package:loyalty_app/features/manager/domain/manager_model.dart';
import 'package:loyalty_app/utils/state_handlers.dart';

class ManagerWalletScreen extends StatefulWidget {
  final Manager manager;
  const ManagerWalletScreen({super.key, required this.manager});

  @override
  State<ManagerWalletScreen> createState() => _ManagerWalletScreenState();
}

class _ManagerWalletScreenState extends State<ManagerWalletScreen> {
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
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: Text(
                  "WALLET",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
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
                            splashColor: Theme.of(context).colorScheme.onSecondary,
                            splashFactory: InkSplash.splashFactory,
                            child: Ink(
                              decoration: BoxDecoration(
                                color: const Color(0xFF6590FF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: Center(
                                  child: Text("Available", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 14, fontWeight: FontWeight.w700)),
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
                                  color: Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                              child: SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: Center(
                                  child: Text("Owned", style: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 14, fontWeight: FontWeight.w700)),
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
                            splashColor: Theme.of(context).colorScheme.onSecondary,
                            splashFactory: InkSplash.splashFactory,
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                              child: SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: Center(
                                  child: Text("Available", style: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 14, fontWeight: FontWeight.w700)),
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
                            splashColor: Theme.of(context).colorScheme.onSecondary,
                            splashFactory: InkSplash.splashFactory,
                            child: Ink(
                              decoration: BoxDecoration(
                                color: const Color(0xFF6590FF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: Center(
                                  child: Text("Owned", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 14, fontWeight: FontWeight.w700)),
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
                      ? const WalletAvailableTab(isDisable: true)
                      : const WalletOwnedTab(isDisable: true,),
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