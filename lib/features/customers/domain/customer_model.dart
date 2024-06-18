import 'package:cloud_firestore/cloud_firestore.dart';

import '../../authentication/domain/user_model.dart';

class Customer {
  final String? name;
  final int points;
  final DocumentReference<UserModel> userRef;

  Customer({
    this.name = "",
    this.points = 0,
    required this.userRef
  });

  factory Customer.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Customer(
      name: data?['name'] ?? "",
      points: data?['points'],
      userRef: (data?['userRef'] as DocumentReference<UserModel>),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name else "name": "",
      "points": points,
      "userRef": userRef,
    };
  }
}