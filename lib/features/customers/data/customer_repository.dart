import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../authentication/domain/user_model.dart';
import '../domain/customer_model.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class CustomerRepository {
  static Customer initializeCustomer(DocumentReference<UserModel> userRef, User user) {
    Customer customer = Customer(userRef: userRef);
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
