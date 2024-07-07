import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? name;
  final String? email;
  final String uid;
  final DateTime? createdAt;
  final bool isLocked;
  final int permissionLevel;
  final int permissionMax;

  UserModel({
    this.createdAt,
    required this.email,
    required this.uid,
    this.name = "",
    this.isLocked = false,
    this.permissionLevel = 0,
    this.permissionMax = 0,
  });

  factory UserModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return UserModel(
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