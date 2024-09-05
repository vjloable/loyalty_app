import 'package:cloud_firestore/cloud_firestore.dart';

class Deal {
  final String title;
  final String description;
  final String storeName;
  final String storeID;
  final String type; //flat or percentage
  final int pointsRequired;
  final double value;
  final List<String>? dayFrequency;
  final Map<int, int>? timeRange;
  final String note;

  Deal({
    required this.title,
    required this.description,
    required this.storeName,
    required this.storeID,
    required this.type,
    required this.value,
    required this.pointsRequired,
    this.dayFrequency,
    this.timeRange,
    this.note = "",
  });

  factory Deal.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Deal(
      title: data?['title'],
      description: data?['description'],
      storeName: data?['storeName'],
      storeID: data?['storeID'],
      type: data?['type'],
      value: data?['value'] as double,
      pointsRequired: data?['pointsRequired'],
      dayFrequency: data?['dayFrequency'] is Iterable
          ? List<String>.from(data?['previousStores'])
          : null,
      timeRange: data?['timeRange'] is Map
          ? Map<int, int>.from(data?['timeRange'])
          : null,
      note: data?['timeRange'] ?? "",
    );
  }

  Map<String, dynamic> toFirestore() {
    // var serverTimestamp = FieldValue.serverTimestamp();
    return {
      "title": title,
      "description": description,
      "storeName": storeName,
      "storeID": storeID,
      "type": type,
      "value": value,
      "pointsRequired": pointsRequired,
      if (dayFrequency != null) "dayFrequency": dayFrequency,
      if (timeRange != null) "timeRange": timeRange,
      "note": note,
    };
  }
}