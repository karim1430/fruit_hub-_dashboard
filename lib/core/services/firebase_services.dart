abstract class FirebaseServices {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? uId,
  });

  Future<Map<String, dynamic>> getData({
    required String path,
    required String uId,
  });
  Future<bool> checkIfUserExist({required String path, required String uId});
}
