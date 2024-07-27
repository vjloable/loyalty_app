import 'package:flutter/material.dart';

class DealCardWidget extends StatefulWidget {
  final Widget? destination;
  const DealCardWidget({super.key, this.destination});

  @override
  State<DealCardWidget> createState() => _DealCardWidgetState();
}

class _DealCardWidgetState extends State<DealCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFFE4E4E4)),
      ),
      elevation: 2,
      child: InkWell(
        onTap: widget.destination == null ? null : () {
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
        child: Column(
          children: [
            Ink(
              height: 140,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            Ink(
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFFE4E4E4),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
