import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../services/auth_service.dart';
import '../../auth/data/auth_repository.dart';
import '../../auth/domain/auth_user.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(authServiceProvider));
});

final authStateProvider = StreamProvider<AuthUser?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
});
