import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  final String name;
  final String code;
  final String location;
  final String? owner;
  final DateTime? addedAt;
  final List<String>? managers;

  Store({
    required this.name,
    required this.code,
    required this.location,
    this.owner,
    this.addedAt,
    this.managers,
  });

  factory Store.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Store(
      name: data?['name'] ?? "",
      code: data?['code'] ?? "",
      location: data?['location'] ?? "",
      owner: data?['owner'] ?? "",
      addedAt: (data?['creation'] as Timestamp).toDate(),
      managers: data?['managers'] is Iterable ? List.from(data?['managers']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    var serverTimestamp = FieldValue.serverTimestamp();
    return {
      "name": name,
      "code": code,
      "location": location,
      if (owner != null) "owner": owner else "owner": "",
      if (addedAt != null) "creation" : addedAt else "creation" : serverTimestamp,
      "managers": managers,
    };
  }
}