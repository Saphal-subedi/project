// import 'package:cloud_firestore/cloud_firestore.dart';


// class FirestoreServices {
//   final collection = "usercollection";
//   final firestoreIns = FirebaseFirestore.instance;

//   Future<String> createUser(RegisterUserModel user) async {
//     try {
//       final ref = firestoreIns.collection(collection);
//       await ref.doc(user.phone).set(user.toJson());
//       return "Successfully register";
//     } catch (e) {
//       return "User not register successfully";
//     }
//   }
// }
