import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_app/features/owner/data/store_repository.dart';
import 'package:loyalty_app/features/owner/presentation/stores/store_add_screen.dart';
import 'package:loyalty_app/features/owner/presentation/stores/store_item_screen.dart';

import '../../../../utils/custom_icons.dart';
import '../../../../utils/graphics.dart';
import '../../../owner/domain/store_model.dart';
import '../../domain/deal_model.dart';
import '../../domain/manager_model.dart';

class DealListScreen extends StatefulWidget {
  final Manager manager;
  const DealListScreen({super.key, required this.manager});

  @override
  State<DealListScreen> createState() => _DealListScreenState();
}

class _DealListScreenState extends State<DealListScreen> {
  final _addFormKey = GlobalKey<FormState>();

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController locationTextEditingController = TextEditingController();

  bool isValidatingAdd = false;

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

  void refresh() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.5),
                  ),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 90),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                minimumSize: const Size(35, 35),
                                surfaceTintColor: Colors.transparent,
                                overlayColor: Theme.of(context).colorScheme.surface,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Theme.of(context).colorScheme.primary),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: CustomIcons.return_arrow(Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ),
                          Text(
                            "MANAGE",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                minimumSize: const Size(35, 35),
                                surfaceTintColor: Colors.transparent,
                                overlayColor: Theme.of(context).colorScheme.surface,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Theme.of(context).colorScheme.primary),
                                ),
                              ),
                              onPressed: () {
                                ///TODO: Navigator.of(context).push(MaterialPageRoute(builder: (context) => StoreAddScreen(owner: widget.owner)));
                              },
                              child: CustomIcons.plus(Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      height: 30,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Stores",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 45,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        controller: null,
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.center,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
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
                          isCollapsed: false,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: CustomIcons.search(Theme.of(context).colorScheme.onSecondary),
                          ),
                          prefixIconColor: const Color(0xFF515151),
                          hintText: 'Search stores...',
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Scrollbar(
                  thickness: 3,
                  child: FutureBuilder(
                    future: StoreRepository.getStoreList(),
                    builder: (BuildContext context, AsyncSnapshot<List<QueryDocumentSnapshot<Store>>> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          List<QueryDocumentSnapshot<Store>> storeList = snapshot.data!;
                          if (storeList.isNotEmpty) {
                            return ListView.separated(
                              padding: const EdgeInsets.only(top: 4),
                              itemCount: storeList.length,
                              separatorBuilder: (BuildContext context, int index) {
                                return const SizedBox(height: 2);
                              },
                              itemBuilder: (BuildContext context, int index) {
                                Store store = storeList.elementAt(index).data();
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context).colorScheme.surface,
                                    elevation: 2,
                                    minimumSize: const Size(double.infinity, 82),
                                    surfaceTintColor: Colors.transparent,
                                    overlayColor: Theme.of(context).colorScheme.onSecondary.withOpacity(0.5),
                                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation, secondaryAnimation) => const StoreItemScreen(),
                                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                          var begin = const Offset(-1.0, 0);
                                          var end = Offset.zero;
                                          var curve = Curves.easeInOut;
                                          var tween = Tween(begin: begin, end: end)
                                              .chain(CurveTween(curve: curve));
                                          return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 24,
                                              width: double.infinity,
                                              child: Text(
                                                store.name,
                                                style: TextStyle(
                                                  color: Theme.of(context).colorScheme.onSecondary,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 18,
                                              width: double.infinity,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    height: 18,
                                                    width: 18,
                                                    child: CustomIcons.location(Theme.of(context).colorScheme.onSecondary),
                                                  ),
                                                  Text(
                                                    store.location,
                                                    style: TextStyle(
                                                      color: Theme.of(context).colorScheme.onSecondary,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Center(child: CustomIcons.long_arrow(Theme.of(context).colorScheme.onSecondary))
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            return Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                height: 312,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 180,
                                        height: 130,
                                        child: Illustration.no_stores,
                                      ),
                                      const SizedBox(height: 30),
                                      SizedBox(
                                        height: 30,
                                        child: Text(
                                          "There are no stores added yet.",
                                          style: TextStyle(
                                            color: Theme.of(context).colorScheme.onSecondary,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                      } else if (snapshot.hasError) {
                        return Center(
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.error,
                              value: null,
                            ),
                          ),
                        );
                      }
                      return Center(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.primary,
                            value: null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
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
