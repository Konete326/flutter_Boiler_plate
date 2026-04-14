import 'package:firebase_database/firebase_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../domain/models/profile_model.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final authState = ref.watch(authStateProvider);
  return ProfileRepository(
    database: FirebaseDatabase.instance,
    uid: authState.value?.uid,
  );
});

class ProfileRepository {
  ProfileRepository({
    required FirebaseDatabase database,
    required String? uid,
  })  : _database = database,
        _uid = uid;

  final FirebaseDatabase _database;
  final String? _uid;

  DatabaseReference get _userRef {
    if (_uid == null) throw Exception('User not authenticated');
    return _database.ref().child('users').child(_uid);
  }

  Future<ProfileModel?> getProfile() async {
    if (_uid == null) return null;
    final snapshot = await _userRef.get();
    if (snapshot.exists && snapshot.value != null) {
      final data = Map<String, dynamic>.from(snapshot.value as Map);
      data['id'] = _uid; // Ensure ID is present
      return ProfileModel.fromJson(data);
    }
    return null;
  }

  Future<void> updateProfile(ProfileModel profile) async {
    await _userRef.update(profile.toJson());
  }
}
