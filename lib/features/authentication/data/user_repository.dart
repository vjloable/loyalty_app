import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loyalty_app/features/authentication/domain/user_model.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class UserRepository {
  static void setUserDocName(GenericUser userModel, String name) {
    GenericUser userModelWithName = GenericUser(
        name: name,
        email: userModel.email,
        uid: userModel.uid,
        createdAt: userModel.createdAt,
        isLocked: userModel.isLocked,
        permissionLevel: userModel.permissionLevel,
    );
    _firebaseFirestore
        .collection("users")
        .withConverter(
      fromFirestore: GenericUser.fromFirestore,
      toFirestore: (GenericUser userModel, options) => userModel.toFirestore(),
    )
        .doc(userModelWithName.uid)
        .set(userModelWithName, SetOptions(merge: true))
        .then((_) {
      print("Successfully added user id");
    }).onError((error, stackTrace) {
      print("Error adding user id");
    });
  }

  static Future<String> setPermissionLevel(GenericUser userModel, int level) {
    return _firebaseFirestore
        .collection("users")
        .withConverter(
      fromFirestore: GenericUser.fromFirestore,
      toFirestore: (GenericUser userModel, options) => userModel.toFirestore(),
    )
        .doc(userModel.uid)
        .update({"permissionLevel": level})
        .then((_) {
          print("Successfully updated permission level");
          return "Success";
        }).onError((error, stackTrace) {
          print("Error updated permission level");
          return "Error";
        });
  }

  static GenericUser initialize(User user) {
    GenericUser userModel = GenericUser(email: user.email, uid: user.uid, name: user.displayName);
    _firebaseFirestore
        .collection("users")
        .withConverter(
      fromFirestore: GenericUser.fromFirestore,
      toFirestore: (GenericUser userModel, options) => userModel.toFirestore(),
    )
        .doc(user.uid)
        .set(userModel, SetOptions(merge: true))
        .then((_) {
      print("Successfully added user id");
    }).onError((error, stackTrace) {
      print("Error adding user id");
    });
    return userModel;
  }

  static Future<GenericUser?> getUserDoc(String uid) async {
    DocumentReference<GenericUser> userModelDocRef = _firebaseFirestore
        .collection("users")
        .doc(uid)
        .withConverter(
      fromFirestore: GenericUser.fromFirestore,
      toFirestore: (GenericUser userModel, _) => userModel.toFirestore(),
    );
    GenericUser? userModel = (await userModelDocRef.get()).data();
    return userModel;
  }
}
