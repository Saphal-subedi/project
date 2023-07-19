import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_woda/User%20Register%20Page/register_user_model.dart';

class FirestoreServices {
  final collection = "usercollection";
  final firestoreIns = FirebaseFirestore.instance;

  Future<String> createUser(RegisterUserModel user) async {
    try {
      final ref = await firestoreIns.collection(collection);
      await ref.doc(user.Phone).set(user.toJson());
      return "Successfully register";
    } catch (e) {
      return "User not register successfully";
    }
  }
}
