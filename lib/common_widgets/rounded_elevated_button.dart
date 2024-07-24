import 'package:flutter/material.dart';

class RoundedElevatedButton extends StatefulWidget {
  final String text;
  final Function()? onPressed;
  final Color backgroundColor;
  final Color? borderColor;
  const RoundedElevatedButton({super.key, this.text = "", this.onPressed, required this.backgroundColor, this.borderColor});

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
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.backgroundColor,
            minimumSize: const Size(double.infinity, 70),
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(widget.text, style: const TextStyle(color: Color(0xFF515151), fontSize: 14, fontWeight: FontWeight.w700))
      ),
    );
  }
}
