import 'package:flutter/material.dart';
import 'package:loyalty_app/utils/custom_icons.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                border: Border(top: BorderSide(color: Color(0xFFE2E2E2)))
            ),
            height: 70,
          ),
          SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: (){},
                  icon: CustomIcons.home_active,
                ),
                IconButton(
                  onPressed: (){},
                  icon: CustomIcons.wallet,
                ),
                IconButton(
                  onPressed: (){},
                  icon: CustomIcons.discover,
                ),
                IconButton(
                  onPressed: (){},
                  icon: CustomIcons.profile,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
