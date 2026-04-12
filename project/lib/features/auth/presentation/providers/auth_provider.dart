import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../services/auth_service.dart';
import '../../auth/data/auth_repository.dart';
import '../../auth/domain/auth_user.dart';

final Provider<AuthService> authServiceProvider = Provider<AuthService>((ProviderRef<AuthService> ref) => AuthService());

final Provider<AuthRepository> authRepositoryProvider = Provider<AuthRepository>((ProviderRef<AuthRepository> ref) {
  return AuthRepository(ref.watch(authServiceProvider));
});

final StreamProvider<AuthUser?> authStateProvider = StreamProvider<AuthUser?>((StreamProviderRef<AuthUser?> ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
});
