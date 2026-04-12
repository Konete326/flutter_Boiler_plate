import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Reference _userFolder(String uid) => _storage.ref().child('users').child(uid);

  Future<String> uploadFile(String uid, String fileName, File file) async {
    final ref = _userFolder(uid).child(fileName);
    final uploadTask = await ref.putFile(file);
    return uploadTask.ref.getDownloadURL();
  }

  Future<void> deleteFile(String uid, String fileName) {
    return _userFolder(uid).child(fileName).delete();
  }
}
