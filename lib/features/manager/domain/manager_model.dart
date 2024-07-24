import 'package:cloud_firestore/cloud_firestore.dart';

class Manager {
  final String? name;
  final String uid;
  final List<String>? branches;

  Manager({
    this.name = "",
    required this.uid,
    this.branches,
  });

  factory Manager.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Manager(
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