import 'package:flutter/material.dart';

class RoundedElevatedButton extends StatefulWidget {
  final Function()? onPressed;
  final Color backgroundColor;
  final Color? borderColor;
  final double height;
  final Widget? child;
  const RoundedElevatedButton({super.key, this.onPressed, required this.backgroundColor, this.borderColor, this.height = 70, this.child});

  @override
  State<RoundedElevatedButton> createState() => _RoundedElevatedButtonState();
}

class _RoundedElevatedButtonState extends State<RoundedElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: widget.borderColor ?? Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.backgroundColor,
            minimumSize: Size(double.infinity, widget.height),
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: widget.child ?? const SizedBox()
      ),
    );
  }
}
