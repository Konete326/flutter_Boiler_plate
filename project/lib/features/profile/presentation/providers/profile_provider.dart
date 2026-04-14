import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/repositories/profile_repository.dart';
import '../../domain/models/profile_model.dart';

final profileProvider = AsyncNotifierProvider<ProfileNotifier, ProfileModel?>(
  ProfileNotifier.new,
);

class ProfileNotifier extends AsyncNotifier<ProfileModel?> {
  late final ProfileRepository _repository;

  @override
  Future<ProfileModel?> build() async {
    _repository = ref.watch(profileRepositoryProvider);
    return _fetchProfile();
  }

  Future<ProfileModel?> _fetchProfile() async {
    try {
      final profile = await _repository.getProfile();
      if (profile != null) return profile;

      // If profile not found, create a default one from auth state
      final authState = ref.read(authStateProvider);
      final user = authState.value;
      
      if (user != null) {
        return ProfileModel(
          id: user.uid,
          name: user.displayName ?? user.email.split('@')[0],
          email: user.email,
          photoUrl: user.photoUrl,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> updateProfile(ProfileModel updatedProfile) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.updateProfile(updatedProfile);
      return updatedProfile;
    });
  }
}
