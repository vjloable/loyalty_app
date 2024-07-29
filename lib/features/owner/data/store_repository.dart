import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/store_model.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class StoreRepository {
  static Future<String> initialize(String name, String location, String owner) {
    Store store = Store(
      name: name,
      code: "",
      location: location,
      owner: owner,
    );

    return _firebaseFirestore
      .collection("stores")
      .withConverter(
        fromFirestore: Store.fromFirestore,
        toFirestore: (Store store, options) => store.toFirestore(),
      )
      .add(store)
      .then((storeDocRef) {
        return _firebaseFirestore
            .collection("stores")
            .doc(storeDocRef.id)
            .update({"code":storeDocRef.id})
            .then((_) {
              print("Successfully added store with ${storeDocRef.id}");
              return "Success";
            })
            .onError((error, stackTrace) {
              print("Error adding owner");
              return "Error";
            });
      });
  }
}
