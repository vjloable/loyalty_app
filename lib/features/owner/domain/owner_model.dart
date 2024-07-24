import 'package:cloud_firestore/cloud_firestore.dart';

class Owner {
  final String? name;
  final String uid;
  final List<String>? branches;

  Owner({
    this.name = "",
    required this.uid,
    this.branches,
  });

  factory Owner.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Owner(
      name: data?['name'] ?? "",
      uid: data?['uid'],
      branches: data?['branches'] is Iterable ? List.from(data?['branches']) : null
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name else "name": "",
      "uid": uid,
      "branches": branches,
    };
  }
}