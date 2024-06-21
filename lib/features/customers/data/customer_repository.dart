import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../domain/customer_model.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class CustomerRepository {
  static Customer initialize(User user) {
    Customer customer = Customer(name: user.displayName, uid: user.uid);
    _firebaseFirestore
        .collection("customers")
        .withConverter(
      fromFirestore: Customer.fromFirestore,
      toFirestore: (Customer customer, options) => customer.toFirestore(),
    )
        .doc(user.uid)
        .set(customer, SetOptions(merge: true))
        .then((_) {
      print("Successfully added customer");
    }).onError((error, stackTrace) {
      print("Error adding customer");
    });
    return customer;
  }

  static Future<Customer?> get(User user) async {
    DocumentReference<Customer> userCustomerDocRef = _firebaseFirestore
        .collection("customers")
        .doc(user.uid)
        .withConverter(
      fromFirestore: Customer.fromFirestore,
      toFirestore: (Customer customer, _) => customer.toFirestore(),
    );
    Customer? customer = (await userCustomerDocRef.get()).data();
    return customer;
  }

  static void setName(User user, String name) {
    _firebaseFirestore
        .collection("customers")
        .doc(user.uid)
        .update({"name": name})
        .then((_) {
      print("Successfully named the customer");
    }).onError((error, stackTrace) {
      print("Error naming the customer");
    });
  }

  // static Future<UserModel?> getUserDoc(User user) async {
  //   DocumentReference<UserModel> userModelDocRef = _firebaseFirestore
  //       .collection("users")
  //       .doc(user.uid)
  //       .withConverter(
  //     fromFirestore: UserModel.fromFirestore,
  //     toFirestore: (UserModel userModel, _) => userModel.toFirestore(),
  //   );
  //   UserModel? userModel = (await userModelDocRef.get()).data();
  //   return userModel;
  // }
}
