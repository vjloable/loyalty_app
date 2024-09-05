import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/customer_model.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class CustomerRepository {
  static Customer initialize(String name, String uid) {
    Customer customer = Customer(name: name, uid: uid);
    _firebaseFirestore
        .collection("customers")
        .withConverter(
      fromFirestore: Customer.fromFirestore,
      toFirestore: (Customer customer, options) => customer.toFirestore(),
    )
        .doc(uid)
        .set(customer, SetOptions(merge: true))
        .then((_) {
      print("Successfully added customer");
    }).onError((error, stackTrace) {
      print("Error adding customer");
    });
    return customer;
  }

  static Future<Customer?> getCustomerDoc(String uid) async {
    DocumentReference<Customer> userCustomerDocRef = _firebaseFirestore
        .collection("customers")
        .doc(uid)
        .withConverter(
      fromFirestore: Customer.fromFirestore,
      toFirestore: (Customer customer, _) => customer.toFirestore(),
    );
    Customer? customer = (await userCustomerDocRef.get()).data();
    return customer;
  }

  static Future<String> setName(String uid, String name) {
    return _firebaseFirestore
        .collection("customers")
        .doc(uid)
        .update({"name": name})
        .then((_) {
          print("Successfully named the customer");
          return "Success";
        }).onError((error, stackTrace) {
          print("Error naming the customer");
          return "Error";
        });
  }

  static Future<String> sendPoints(String uid, int points) {
    DocumentReference<Map<String, dynamic>> customerDocRef = _firebaseFirestore
        .collection("customers")
        .doc(uid);
    return _firebaseFirestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(customerDocRef);
      final newPoints = snapshot.get("points") + points;
      final newScanCounts = snapshot.get("scan_count") + 1;
      transaction.update(customerDocRef, {"points": newPoints, "scan_count": newScanCounts});
    }).then((value) {
      print("DocumentSnapshot successfully updated!");
      return "Success";
    },
      onError: (e) {
        print("Error updating document $e");
        return "Error";
      },
    );
  }
}
