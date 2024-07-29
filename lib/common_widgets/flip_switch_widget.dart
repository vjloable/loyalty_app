import 'package:flutter/material.dart';
import 'package:loyalty_app/utils/state_handlers.dart';

class FlipSwitch extends StatefulWidget {
  final FlipSwitchStateHandler flipSwitchStateHandler;
  final Function()? onTap;
  const FlipSwitch({super.key, required this.flipSwitchStateHandler, this.onTap});

  @override
  State<FlipSwitch> createState() => _FlipSwitchState();
}

class _FlipSwitchState extends State<FlipSwitch> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          height: 28,
          width: 60,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Container(
                height: 28,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Theme.of(context).colorScheme.primary),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
              ),
              AnimatedBuilder(
                animation: widget.flipSwitchStateHandler,
                builder: (BuildContext context, Widget? child) {
                  return AnimatedAlign(
                    alignment: widget.flipSwitchStateHandler.isFlipSwitchedOn ? Alignment.centerRight : Alignment.centerLeft,
                    duration: const Duration(milliseconds: 400),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
