import 'package:flutter/material.dart';
import 'package:loyalty_app/utils/custom_icons.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? child;
  final double height;

  const TopAppBar({
    super.key,
    this.child,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Container(
        height: preferredSize.height,
        color: const Color(0xFFFFFFFF),
        alignment: Alignment.center,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 35,
              width: double.infinity,
              child: CustomIcons.top_icon,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}