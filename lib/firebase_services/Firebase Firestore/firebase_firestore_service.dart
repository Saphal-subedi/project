import 'package:cloud_firestore/cloud_firestore.dart';
<<<<<<< HEAD:lib/Firebase Firestore/firebase_firestore_service.dart
import 'package:e_woda/New%20Home%20Page/User%20Register%20Page/register_user_model.dart';
=======
import 'package:e_woda/models/register_user_model.dart';
>>>>>>> 33199bb4326b88636056f8972d9b98c9865841e9:lib/firebase_services/Firebase Firestore/firebase_firestore_service.dart

class FirestoreServices {
  final collection = "usercollection";
  final firestoreIns = FirebaseFirestore.instance;

  Future<String> createUser(RegisterUserModel user) async {
    try {
      final ref = firestoreIns.collection(collection);
      await ref.doc(user.phone).set(user.toJson());
      return "Successfully register";
    } catch (e) {
      return "User not register successfully";
    }
  }
}
