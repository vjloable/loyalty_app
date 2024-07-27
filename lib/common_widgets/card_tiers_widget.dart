import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../features/customer/domain/customer_model.dart';

class CardTier extends StatefulWidget {
  final Widget card;
  final bool flipped;
  final Customer? customer;
  const CardTier({super.key, required this.card, this.flipped = false, required this.customer});

  @override
  State<CardTier> createState() => _CardTierState();
}

class _CardTierState extends State<CardTier> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: widget.flipped ?
      Container(
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Center(
            child: QrImageView(
              data: widget.customer == null ? "" : widget.customer!.uid,
              version: QrVersions.auto,
              size: 200,
            ),
          ),
        ),
      ) : Container(
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            widget.card,
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    widget.customer == null ?
                    const SizedBox() :
                    Text(
                      widget.customer!.name??"",
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Color(0xFF515151),
                        fontWeight: FontWeight.w300,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      widget.customer == null ? "..." : "${widget.customer!.points}",
                      style: const TextStyle(
                        color: Color(0xFF515151),
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    const Text(
                      'Loyalty Points',
                      style: TextStyle(
                        color: Color(0xFF515151),
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
