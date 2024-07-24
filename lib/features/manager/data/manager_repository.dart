import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/manager_model.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class ManagerRepository {
  static Manager initialize(String name, String uid) {
    Manager manager = Manager(name: name, uid: uid);
    _firebaseFirestore
        .collection("managers")
        .withConverter(
      fromFirestore: Manager.fromFirestore,
      toFirestore: (Manager manager, options) => manager.toFirestore(),
    )
        .doc(uid)
        .set(manager, SetOptions(merge: true))
        .then((_) {
      print("Successfully added manager");
    }).onError((error, stackTrace) {
      print("Error adding manager");
    });
    return manager;
  }

  static Future<Manager?> getManagerDoc(String uid) async {
    DocumentReference<Manager> userManagerDocRef = _firebaseFirestore
        .collection("managers")
        .doc(uid)
        .withConverter(
      fromFirestore: Manager.fromFirestore,
      toFirestore: (Manager manager, _) => manager.toFirestore(),
    );
    Manager? manager = (await userManagerDocRef.get()).data();
    return manager;
  }
}
