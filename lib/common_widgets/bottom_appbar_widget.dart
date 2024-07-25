import 'package:flutter/material.dart';
import 'package:loyalty_app/utils/custom_icons.dart';
import 'package:loyalty_app/utils/state_handlers.dart';

class CustomBottomAppBar extends StatelessWidget {
  final PageStateHandler pageStateHandler;
  const CustomBottomAppBar({super.key, required this.pageStateHandler});

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
                  onPressed: (){
                    pageStateHandler.gotoPage(0);
                  },
                  icon: AnimatedBuilder(
                    animation: pageStateHandler,
                    builder: (context, child) {
                      return pageStateHandler.currentPage == 0 ? CustomIcons.home_active : CustomIcons.home;
                    },
                  ),
                ),
                IconButton(
                  onPressed: (){
                    pageStateHandler.gotoPage(1);
                  },
                  icon: AnimatedBuilder(
                    animation: pageStateHandler,
                    builder: (context, child) {
                      return pageStateHandler.currentPage == 1 ? CustomIcons.wallet_active : CustomIcons.wallet;
                    },
                  ),
                ),
                IconButton(
                  onPressed: (){
                    pageStateHandler.gotoPage(2);
                  },
                  icon: AnimatedBuilder(
                    animation: pageStateHandler,
                    builder: (context, child) {
                      return pageStateHandler.currentPage == 2 ? CustomIcons.discover_active : CustomIcons.discover;
                    },
                  ),
                ),
                IconButton(
                  onPressed: (){
                    pageStateHandler.gotoPage(3);
                  },
                  icon: AnimatedBuilder(
                    animation: pageStateHandler,
                    builder: (context, child) {
                      return pageStateHandler.currentPage == 3 ? CustomIcons.profile_active : CustomIcons.profile;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
