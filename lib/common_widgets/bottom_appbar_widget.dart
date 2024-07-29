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
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(top: BorderSide(color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.25)))
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
                  icon: SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: AnimatedBuilder(
                        animation: pageStateHandler,
                        builder: (context, child) {
                          return pageStateHandler.currentPage == 0 ? CustomIcons.home(Theme.of(context).colorScheme.primary) : CustomIcons.home(Theme.of(context).colorScheme.onSecondary);
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: (){
                    pageStateHandler.gotoPage(1);
                  },
                  icon: Container(
                    height: 40,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3, bottom: 2, left: 4, right: 4),
                      child: AnimatedBuilder(
                        animation: pageStateHandler,
                        builder: (context, child) {
                          return pageStateHandler.currentPage == 1 ? CustomIcons.wallet(Theme.of(context).colorScheme.primary) : CustomIcons.wallet(Theme.of(context).colorScheme.onSecondary);
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: (){
                    pageStateHandler.gotoPage(2);
                  },
                  icon: SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: AnimatedBuilder(
                        animation: pageStateHandler,
                        builder: (context, child) {
                          return pageStateHandler.currentPage == 2 ? CustomIcons.discover(Theme.of(context).colorScheme.primary) : CustomIcons.discover(Theme.of(context).colorScheme.onSecondary);
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: (){
                    pageStateHandler.gotoPage(3);
                  },
                  icon: SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedBuilder(
                        animation: pageStateHandler,
                        builder: (context, child) {
                          return pageStateHandler.currentPage == 3 ? CustomIcons.profile(Theme.of(context).colorScheme.primary) : CustomIcons.profile(Theme.of(context).colorScheme.onSecondary);
                        },
                      ),
                    ),
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
