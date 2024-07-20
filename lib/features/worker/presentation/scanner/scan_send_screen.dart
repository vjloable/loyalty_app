import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loyalty_app/features/customer/data/customer_repository.dart';

import '../../../../utils/custom_icons.dart';

class ScanSendScreen extends StatefulWidget {
  final String recipient;
  const ScanSendScreen({super.key, required this.recipient});

  @override
  State<ScanSendScreen> createState() => _ScanSendScreenState();
}

class _ScanSendScreenState extends State<ScanSendScreen> {
  final _sendFormKey = GlobalKey<FormState>();

  TextEditingController amountTextEditingController = TextEditingController();

  bool isValidatingSend = false;

  void showValidationResponse(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Color(0xFFFF7373))),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.none,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 100,
            right: 20,
            left: 20
        ),
        backgroundColor: const Color(0x80515151),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        height: 50,
                        width: 110,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              SizedBox(
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0,8,8,8),
                                  child: SizedBox(
                                    height: 26,
                                    width: 13,
                                    child: CustomIcons.back_arrow_dark,
                                  ),
                                ),
                              ),
                              const Text(
                                "RETURN",
                                style: TextStyle(
                                  color: Color(0xFF515151),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "SEND POINTS",
                        style: TextStyle(
                          color: Color(0xFF515151),
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Form(
                        key: _sendFormKey,
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Recipient",
                                style: TextStyle(
                                  color: Color(0xFF515151),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: SizedBox(
                                height: 67,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 45,
                                      decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x00000000),
                                          ),
                                          BoxShadow(
                                            color: Color(0xFFFBFBFB),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 67,
                                      child: TextFormField(
                                        enabled: false,
                                        textAlign: TextAlign.center,
                                        textAlignVertical: TextAlignVertical.center,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          disabledBorder:  const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            borderSide: BorderSide(color: Color(0x00000000)),
                                          ),
                                          filled: true,
                                          fillColor: const Color(0x80515151),
                                          isCollapsed: false,
                                          contentPadding: const EdgeInsets.fromLTRB(45, 5, 45, 8),
                                          prefixIconColor: const Color(0xFF515151),
                                          hintText: widget.recipient,
                                          hintStyle: const TextStyle(
                                            color: Color(0xFF515151),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Amount",
                                style: TextStyle(
                                  color: Color(0xFF515151),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: SizedBox(
                                height: 67,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 48,
                                      decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x40000000),
                                          ),
                                          BoxShadow(
                                            color: Color(0xFFFBFBFB),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 67,
                                      child: TextFormField(
                                        controller: amountTextEditingController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Kindly enter at least 1 point of amount';
                                          }
                                          return null;
                                        },
                                        textAlign: TextAlign.center,
                                        textAlignVertical: TextAlignVertical.center,
                                        obscureText: false,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            borderSide: BorderSide(color: Colors.red),
                                          ),
                                          errorStyle: TextStyle(
                                            color: Color(0xFFFF7373),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            borderSide: BorderSide(color: Color(0xFFFF7373)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            borderSide: BorderSide(color: Colors.transparent),
                                          ),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          isCollapsed: false,
                                          contentPadding: EdgeInsets.fromLTRB(45, 5, 45, 8),
                                          prefixIconColor: Color(0xFF515151),
                                          hintText: 'Enter amount of points',
                                          hintStyle: TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: ElevatedButton(
                    onPressed: isValidatingSend ? null : () async {
                      String validation = "Error";
                      setState(() {
                        isValidatingSend = true;
                      });
                      if (_sendFormKey.currentState!.validate()) {
                        validation = await CustomerRepository.sendPoints(widget.recipient, int.parse(amountTextEditingController.text));
                      }
                      if (validation == "Error") {
                        showValidationResponse("Unable to send points to the recipient");
                      } else if (validation == "Success") {
                        Future.delayed(const Duration(milliseconds: 100), () {
                          Navigator.of(context).pop();
                        });
                      }
                      setState(() {
                        isValidatingSend = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6590FF),
                      minimumSize: const Size(double.infinity, 80),
                      surfaceTintColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Color(0xFF6590FF))
                      ),
                      elevation: 4,
                    ),
                    child: isValidatingSend
                        ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Color(0xFF6590FF)))
                        : const Text("SEND", style: TextStyle(color: Color(0xFFF9F9F9), fontSize: 24, fontWeight: FontWeight.w600))
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    amountTextEditingController.dispose();
    super.dispose();
  }
}