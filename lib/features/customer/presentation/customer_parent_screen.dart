import 'package:flutter/material.dart';
import 'package:loyalty_app/features/authentication/application/authentication_service.dart';

import '../../../common_widgets/bottom_appbar_widget.dart';
import '../../../common_widgets/top_appbar_widget.dart';
import '../../../utils/page_state_handler.dart';
import '../data/customer_repository.dart';
import '../domain/customer_model.dart';
import 'customer_account_screen.dart';
import 'customer_home_screen.dart';

class CustomerParentScreen extends StatefulWidget {
  final Customer customer;
  const CustomerParentScreen({super.key, required this.customer});

  @override
  State<CustomerParentScreen> createState() => _CustomerParentScreenState();
}

class _CustomerParentScreenState extends State<CustomerParentScreen> {
  PageStateHandler pageStateHandler = PageStateHandler();

  Future<void> refreshCustomer() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF9F9F9),
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: const TopAppBar(height: 80),
        body: FutureBuilder(
          future: CustomerRepository.getCustomerDoc(widget.customer.uid),
          initialData: widget.customer,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                Customer customer = snapshot.data!;
                return AnimatedBuilder(
                  animation: pageStateHandler,
                  builder: (context, child) {
                    return pageStateHandler.currentPage == 0
                        ? CustomerHomeScreen(customer: customer, callback: refreshCustomer,)
                        : pageStateHandler.currentPage == 1
                        ? const Placeholder()
                        : pageStateHandler.currentPage == 2
                        ? const Placeholder()
                        : pageStateHandler.currentPage == 3
                        ? CustomerAccountScreen(customer: customer) : const Placeholder();
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
