import 'package:flutter/material.dart';

import '../../../common_widgets/bottom_appbar_widget.dart';
import '../../../common_widgets/top_appbar_widget.dart';
import '../../../utils/state_handlers.dart';
import '../../authentication/application/authentication_service.dart';
import '../data/manager_repository.dart';
import '../domain/manager_model.dart';
import 'manager_account_screen.dart';
import 'manager_home_screen.dart';

class ManagerParentScreen extends StatefulWidget {
  final Manager manager;
  const ManagerParentScreen({super.key, required this.manager });

  @override
  State<ManagerParentScreen> createState() => _ManagerParentScreenState();
}

class _ManagerParentScreenState extends State<ManagerParentScreen> {
  PageStateHandler pageStateHandler = PageStateHandler();

  Future<void> refreshWorker() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: const TopAppBar(height: 80),
        body: FutureBuilder(
          future: ManagerRepository.getManagerDoc(widget.manager.uid),
          initialData: widget.manager,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                Manager manager = snapshot.data!;
                return AnimatedBuilder(
                  animation: pageStateHandler,
                  builder: (context, child) {
                    return pageStateHandler.currentPage == 0
                        ? ManagerHomeScreen(manager: manager, callback: refreshWorker,)
                        : pageStateHandler.currentPage == 1
                        ? const Placeholder()
                        : pageStateHandler.currentPage == 2
                        ? const Placeholder()
                        : pageStateHandler.currentPage == 3
                        ? ManagerAccountScreen(manager: manager,) : const Placeholder();
                  },
                );
              }
            } else if (snapshot.hasError) {
              return const Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(
                    color: Color(0xFFFF7373),
                    value: null,
                  ),
                ),
              );
            }
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    AuthenticationService.signOut();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6590FF),
                    minimumSize: const Size(double.infinity, 40),
                    surfaceTintColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Color(0xFF6590FF))
                    ),
                    elevation: 4,
                  ),
                  child: const Text("LOGOUT", style: TextStyle(color: Color(0xFFF9F9F9), fontSize: 18, fontWeight: FontWeight.w600)),
                ),
              ),
            );
          }
        ),
        bottomNavigationBar: CustomBottomAppBar(pageStateHandler: pageStateHandler),
      ),
    );
  }
}
