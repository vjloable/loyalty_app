import 'package:cloud_firestore/cloud_firestore.dart';

class Manager {
  final String name;
  final String uid;
  final String? currentStore;
  final List<String>? previousStores;

  Manager({
    required this.name,
    required this.uid,
    this.currentStore,
    this.previousStores,
  });

  factory Manager.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Manager(
      name: data?['name'] ?? "",
      uid: data?['uid'],
      currentStore: data?['currentStore'],
      previousStores: data?['previousStores'] is Iterable ? List.from(data?['previousStores']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    // var serverTimestamp = FieldValue.serverTimestamp();
    return {
      "name": name,
      "uid": uid,
      "currentStore": currentStore,
      "previousStores": previousStores,
    };
  }
}