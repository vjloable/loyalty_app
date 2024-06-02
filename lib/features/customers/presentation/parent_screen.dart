import 'package:flutter/material.dart';
import 'package:loyalty_app/common_widgets/bottom_appbar_widget.dart';
import 'package:loyalty_app/common_widgets/top_appbar_widget.dart';
import 'package:loyalty_app/features/customers/presentation/account_screen.dart';
import 'package:loyalty_app/features/customers/presentation/home_screen.dart';
import 'package:loyalty_app/utils/page_state_handler.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  PageStateHandler pageStateHandler = PageStateHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF9F9F9),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: const TopAppBar(height: 105),
      body: AnimatedBuilder(
          animation: pageStateHandler,
          builder: (context, child) {
            return pageStateHandler.currentPage == 0
                ? const HomeScreen()
                : pageStateHandler.currentPage == 1
                ? const Placeholder()
                : pageStateHandler.currentPage == 2
                ? const Placeholder()
                : pageStateHandler.currentPage == 3
                ? const AccountScreen() : const Placeholder();
          },
      ),
      bottomNavigationBar: CustomBottomAppBar(pageStateHandler: pageStateHandler),
    );
  }
}
