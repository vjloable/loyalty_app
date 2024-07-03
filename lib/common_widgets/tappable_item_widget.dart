import 'package:flutter/material.dart';

class TappableItem extends StatefulWidget {
  final Color? backgroundColor;
  final Color? tappedColor;
  final Color? textColor;
  final String text;
  final Widget? icon;
  final Function()? onTap;
  const TappableItem({super.key, this.backgroundColor, this.textColor, this.text = "", this.icon, this.onTap, this.tappedColor});

  @override
  State<TappableItem> createState() => _TappableItemState();
}

class _TappableItemState extends State<TappableItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: Material(
        color: widget.backgroundColor??const Color(0xFFFFFFFF),
        shape: const Border(bottom: BorderSide(color: Color(0x80959595))),
        child: InkWell(
          onTap: widget.onTap,
          overlayColor: WidgetStateProperty.all(widget.tappedColor),
          splashColor: widget.tappedColor??Colors.black.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 40, height: 40, child: widget.icon??const Placeholder()),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: widget.textColor??const Color(0xFF4E4E4E),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
