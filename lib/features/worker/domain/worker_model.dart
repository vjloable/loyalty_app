import 'package:cloud_firestore/cloud_firestore.dart';

class Worker {
  final String? name;
  final String uid;
  final String? branch;

  Worker({
    this.name = "",
    required this.uid,
    this.branch,
  });

  factory Worker.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Worker(
      name: data?['name'] ?? "",
      uid: data?['uid'],
      branch: data?['branch']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name else "name": "",
      "uid": uid,
      "branch": branch,
    };
  }
}