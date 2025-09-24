import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_dashboard/core/services/firebase_services.dart';

class FirestoreServices extends FirebaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? uId,
  }) {
    if (uId != null) {
      return firestore.collection(path).doc(uId).set(data);
    } else {
      return firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String uId,
  }) async {
    var data = await firestore.collection(path).doc(uId).get();
    return data.data()!;
  }

  @override
  Future<bool> checkIfUserExist({
    required String path,
    required String uId,
  }) async {
    var user = await firestore.collection(path).doc(uId).get();
    return user.exists;
  }
}
