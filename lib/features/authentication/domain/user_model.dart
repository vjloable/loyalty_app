import 'package:cloud_firestore/cloud_firestore.dart';

class GenericUser{
  final String uid;
  final String? name;
  final String? email;
  final DateTime? createdAt;
  final bool isLocked;
  final int permissionLevel;
  final int permissionMax;

  GenericUser({
    this.name = "",
    required this.uid,
    this.createdAt,
    required this.email,
    this.isLocked = false,
    this.permissionLevel = 0,
    this.permissionMax = 0,
  });

  factory GenericUser.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return GenericUser(
      name: data?['name'] ?? "",
      email: data?['email'] ?? "",
      uid: data?['uid'],
      createdAt: (data?['creation'] as Timestamp).toDate(),
      isLocked: data?['isLocked'],
      permissionLevel: data?['permissionLevel'],
      permissionMax: data?['permissionMax'],
    );
  }

  Map<String, dynamic> toFirestore() {
    var serverTimestamp = FieldValue.serverTimestamp();
    return {
      if (name != null) "name": name else "name": "",
      if (email != null) "email" : email else "email" : "",
      "uid": uid,
      if (createdAt != null) "creation" : createdAt else "creation" : serverTimestamp,
      "isLocked": isLocked,
      "permissionLevel": permissionLevel,
      "permissionMax": permissionMax,
    };
  }
}