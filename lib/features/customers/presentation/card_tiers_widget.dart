import 'package:flutter/material.dart';

class CardTier extends StatelessWidget {
  final Widget card;
  final String? name;
  const CardTier({super.key, required this.card, required this.name});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Stack(
        children: [
          card,
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
                  Text(
                    name??"",
                    style: const TextStyle(
                      color: Color(0xFF515151),
                      fontWeight: FontWeight.w300,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    '1030.50',
                    style: TextStyle(
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
    );
  }
}
