import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  final String? name;
  final String uid;
  final int points;

  Customer({
    this.name = "",
    required this.uid,
    this.points = 0,
  });

  factory Customer.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Customer(
      name: data?['name'] ?? "",
      uid: data?['uid'],
      points: data?['points'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name else "name": "",
      "uid": uid,
      "points": points,
    };
  }
}