import 'package:flutter/material.dart';
import 'package:loyalty_app/features/owner/presentation/stores/store_list_screen.dart';

import '../../../../utils/custom_icons.dart';
import '../../data/store_repository.dart';
import '../../domain/owner_model.dart';

class StoreAddScreen extends StatefulWidget {
  final Owner owner;
  const StoreAddScreen({super.key, required this.owner});

  @override
  State<StoreAddScreen> createState() => _StoreAddScreenState();
}

class _StoreAddScreenState extends State<StoreAddScreen> {
  final _addFormKey = GlobalKey<FormState>();

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController locationTextEditingController = TextEditingController();

  bool isValidatingAdd = false;

  void showValidationResponse(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Theme.of(context).colorScheme.error)),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.none,
        backgroundColor: Theme.of(context).colorScheme.surface,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          right: 20,
          left: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
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
                                    child: CustomIcons.back_arrow(Theme.of(context).colorScheme.onSecondary),
                                  ),
                                ),
                              ),
                              Text(
                                "RETURN",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSecondary,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "ADD STORE",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
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
                        key: _addFormKey,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Store Name",
                                style: TextStyle(
                                  color:Theme.of(context).colorScheme.onSecondary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: SizedBox(
                                height: 67,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 48,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 67,
                                      child: TextFormField(
                                        controller: nameTextEditingController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please provide a store name';
                                          }
                                          return null;
                                        },
                                        textAlign: TextAlign.center,
                                        textAlignVertical: TextAlignVertical.center,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                                            borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                                          ),
                                          errorStyle: TextStyle(
                                            color: Theme.of(context).colorScheme.error,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                                            borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                                            borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
                                          ),
                                          filled: true,
                                          fillColor: Theme.of(context).colorScheme.surface,
                                          isCollapsed: false,
                                          contentPadding: const EdgeInsets.fromLTRB(45, 5, 45, 8),
                                          hintText: 'Enter the name of your store',
                                          hintStyle: TextStyle(
                                            color: Theme.of(context).colorScheme.onSecondary,
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "General Location",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSecondary,
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
                                        borderRadius: BorderRadius.all(Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 67,
                                      child: TextFormField(
                                        controller: locationTextEditingController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please provide the general location';
                                          }
                                          return null;
                                        },
                                        textAlign: TextAlign.center,
                                        textAlignVertical: TextAlignVertical.center,
                                        obscureText: false,
                                        minLines: 1,
                                        maxLines: 4,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                                            borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                                          ),
                                          errorStyle: TextStyle(
                                            color: Theme.of(context).colorScheme.error,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                                            borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                                            borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
                                          ),
                                          filled: true,
                                          fillColor: Theme.of(context).colorScheme.surface,
                                          isCollapsed: false,
                                          contentPadding: const EdgeInsets.fromLTRB(45, 5, 45, 8),
                                          hintText: 'Enter the general location of the store',
                                          hintStyle: TextStyle(
                                            color: Theme.of(context).colorScheme.onSecondary,
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: const Size(double.infinity, 45),
                    surfaceTintColor: Colors.transparent,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  onPressed: isValidatingAdd ? null : () async {
                    String validation = "Error";
                    setState(() {
                      isValidatingAdd = true;
                    });
                    if (_addFormKey.currentState!.validate()) {
                      validation = await StoreRepository.initialize(nameTextEditingController.text, locationTextEditingController.text, widget.owner.uid);
                    }
                    if (validation == "Error") {
                      showValidationResponse("Unable to create store");
                    } else if (validation == "Success") {
                      Future.delayed(const Duration(milliseconds: 100), () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => StoreListScreen(owner: widget.owner)));
                      });
                    }
                    setState(() {
                      isValidatingAdd = false;
                    });
                  },
                  child: isValidatingAdd
                      ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary))
                      : Text("ADD", style: TextStyle(color: Theme.of(context).colorScheme.surface, fontSize: 18, fontWeight: FontWeight.w700)),
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
    nameTextEditingController.dispose();
    locationTextEditingController.dispose();
    super.dispose();
  }
}
