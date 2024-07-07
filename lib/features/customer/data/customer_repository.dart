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
