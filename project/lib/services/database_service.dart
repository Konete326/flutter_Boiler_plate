import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final FirebaseDatabase _db = FirebaseDatabase.instance;

  DatabaseReference _userRef(String uid) => _db.ref('users/$uid');

  Future<void> setUserData(String uid, Map<String, dynamic> data) {
    return _userRef(uid).set(data);
  }

  Future<DataSnapshot> getUserData(String uid) {
    return _userRef(uid).get();
  }

  Stream<DatabaseEvent> userStream(String uid) {
    return _userRef(uid).onValue;
  }

  Future<void> updateUserData(String uid, Map<String, dynamic> data) {
    return _userRef(uid).update(data);
  }
}
