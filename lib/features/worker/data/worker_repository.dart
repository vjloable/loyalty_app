import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/worker_model.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class WorkerRepository {
  static Worker initialize(String name, String uid) {
    Worker worker = Worker(name: name, uid: uid);
    _firebaseFirestore
        .collection("workers")
        .withConverter(
      fromFirestore: Worker.fromFirestore,
      toFirestore: (Worker worker, options) => worker.toFirestore(),
    )
        .doc(uid)
        .set(worker, SetOptions(merge: true))
        .then((_) {
      print("Successfully added worker");
    }).onError((error, stackTrace) {
      print("Error adding worker");
    });
    return worker;
  }

  static Future<Worker?> getWorkerDoc(String uid) async {
    DocumentReference<Worker> userWorkerDocRef = _firebaseFirestore
        .collection("workers")
        .doc(uid)
        .withConverter(
      fromFirestore: Worker.fromFirestore,
      toFirestore: (Worker worker, _) => worker.toFirestore(),
    );
    Worker? worker = (await userWorkerDocRef.get()).data();
    return worker;
  }

}
