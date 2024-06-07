import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loyalty_app/features/authentication/domain/user_model.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class UserRepository {
  static void setUserDocName(UserModel userModel, String name) {
    UserModel userModelWithName = UserModel(
        name: name,
        email: userModel.email,
        uid: userModel.uid,
        permissions: userModel.permissions,
        createdAt: userModel.createdAt,
        isLocked: userModel.isLocked
    );
    _firebaseFirestore
        .collection("users")
        .withConverter(
      fromFirestore: UserModel.fromFirestore,
      toFirestore: (UserModel userModel, options) => userModel.toFirestore(),
    )
        .doc(userModelWithName.uid)
        .set(userModelWithName, SetOptions(merge: true))
        .then((_) {
      print("Successfully added user id");
    }).onError((error, stackTrace) {
      print("Error adding user id");
    });
  }

  static UserModel setInitialUserDoc(User user) {
    UserModel userModel = UserModel(email: user.email, uid: user.uid);
    _firebaseFirestore
        .collection("users")
        .withConverter(
      fromFirestore: UserModel.fromFirestore,
      toFirestore: (UserModel userModel, options) => userModel.toFirestore(),
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

  static Future<UserModel?> getUserDoc(User user) async {
    DocumentReference<UserModel> userModelDocRef = _firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .withConverter(
      fromFirestore: UserModel.fromFirestore,
      toFirestore: (UserModel userModel, _) => userModel.toFirestore(),
    );
    UserModel? userModel = (await userModelDocRef.get()).data();
    return userModel;
    //     .then((userModelDoc) async {
    //   if (!userModelDoc.exists) {
    //
    //   }
    //   else {
    //     UserModel userModel = userModelDoc.data()!;
    //     if (userModel.isLocked) {
    //     } else {
    //       if (userModel.name == null) {
    //
    //         // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateDisplayNamePage(userDocReference: userDocRef)));
    //       } else {
    //         switch (userModel.permissions) {
    //           case 0:
    //
    //             // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ParentScreen()));
    //             break;
    //         }
    //       }
    //     }
    //   }
    // });
  }
}
