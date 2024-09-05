import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/deal_model.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class DealRepository {
  // static Deal initialize(String name, String uid) {
  //   Deal deal = Deal(
  //     title: '',
  //     description: '',
  //     storeName: '',
  //     storeID: '',
  //     type: '',
  //     value: null,
  //     pointsRequired: null,
  //   );
  //   _firebaseFirestore
  //       .collection("deals")
  //       .withConverter(
  //     fromFirestore: Deal.fromFirestore,
  //     toFirestore: (Deal deal, options) => deal.toFirestore(),
  //   )
  //       .doc(uid)
  //       .set(deal, SetOptions(merge: true))
  //       .then((_) {
  //     print("Successfully added deal");
  //   }).onError((error, stackTrace) {
  //     print("Error adding deal");
  //   });
  //   return deal;
  // }

  static Future<Deal?> getDealDoc(String uid) async {
    DocumentReference<Deal> userDealDocRef = _firebaseFirestore
        .collection("deals")
        .doc(uid)
        .withConverter(
      fromFirestore: Deal.fromFirestore,
      toFirestore: (Deal deal, _) => deal.toFirestore(),
    );
    Deal? deal = (await userDealDocRef.get()).data();
    return deal;
  }

  static Future<List<QueryDocumentSnapshot<Deal>>> getDealList() {
    return _firebaseFirestore
        .collection("deals")
        .withConverter(fromFirestore: Deal.fromFirestore, toFirestore: (Deal deal, options) => deal.toFirestore(),)
        .get()
        .then((QuerySnapshot<Deal> querySnapshot) {
      return querySnapshot.docs.cast();
    },
    );
  }
}
