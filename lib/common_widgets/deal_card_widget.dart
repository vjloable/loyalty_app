import 'package:flutter/material.dart';

class DealCardWidget extends StatefulWidget {
  final Widget? destination;
  final bool hasButtons;
  const DealCardWidget({super.key, this.destination, required this.hasButtons});

  @override
  State<DealCardWidget> createState() => _DealCardWidgetState();
}

class _DealCardWidgetState extends State<DealCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: InkWell(
        overlayColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.surfaceContainerHigh),
        onTap: widget.hasButtons ? null : widget.destination == null ? null : () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => widget.destination!,
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = const Offset(0.0, 1.0);
                var end = Offset.zero;
                var curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Row(
          children: [
            Expanded(
              child: Ink(
                height: 140,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surfaceContainerHigh.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "20% OFF",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surfaceContainerHigh,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "Gym",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surfaceContainerHigh,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            widget.hasButtons ?
            Ink(
              height: 140,
              width: 134,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.surface,
                          elevation: 2,
                          minimumSize: const Size(double.infinity, 45),
                          surfaceTintColor: Colors.transparent,
                          overlayColor: Theme.of(context).colorScheme.surfaceContainerLow,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.surfaceContainerLow,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "GIFT",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surfaceContainerLow,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
                          elevation: 2,
                          minimumSize: const Size(double.infinity, 45),
                          surfaceTintColor: Colors.transparent,
                          overlayColor: Theme.of(context).colorScheme.surface,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "ACTIVATE",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ) :
            Ink(
              height: 140,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "100",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surfaceContainerLow,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "POINTS",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surfaceContainerLow,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
