import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/owner_model.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class OwnerRepository {
  static Owner initialize(String name, String uid) {
    Owner owner = Owner(name: name, uid: uid);
    _firebaseFirestore
        .collection("owners")
        .withConverter(
      fromFirestore: Owner.fromFirestore,
      toFirestore: (Owner owner, options) => owner.toFirestore(),
    )
        .doc(uid)
        .set(owner, SetOptions(merge: true))
        .then((_) {
      print("Successfully added owner");
    }).onError((error, stackTrace) {
      print("Error adding owner");
    });
    return owner;
  }

  static Future<Owner?> getOwnerDoc(String uid) async {
    DocumentReference<Owner> userOwnerDocRef = _firebaseFirestore
        .collection("owners")
        .doc(uid)
        .withConverter(
      fromFirestore: Owner.fromFirestore,
      toFirestore: (Owner owner, _) => owner.toFirestore(),
    );
    Owner? owner = (await userOwnerDocRef.get()).data();
    return owner;
  }
}
