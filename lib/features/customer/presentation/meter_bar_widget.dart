import 'package:flutter/material.dart';
import 'package:loyalty_app/utils/custom_icons.dart';

class MeterBar extends StatefulWidget {
  final int value;
  const MeterBar({super.key, required this.value});

  @override
  State<MeterBar> createState() => _MeterBarState();
}

class _MeterBarState extends State<MeterBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.centerLeft,
        children: [
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            elevation: 5,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF6590FF),
              backgroundColor: const Color(0xFFD0DDFF),
              value: widget.value / 100,
              minHeight: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: CustomIcons.meter_bar_icon,
          ),
        ],
      ),
    );
  }
}
