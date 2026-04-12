import 'package:firebase_auth/firebase_auth.dart';
import '../../../services/auth_service.dart';
import '../domain/auth_user.dart';

class AuthRepository {
  AuthRepository(this._authService);
  final AuthService _authService;

  AuthUser? _mapFirebaseUser(User? user) {
    if (user == null) return null;
    return AuthUser(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }

  Stream<AuthUser?> authStateChanges() {
    return _authService.authStateChanges.map(_mapFirebaseUser);
  }

  Future<AuthUser?> signIn(String email, String password) async {
    final credential = await _authService.signInWithEmail(email, password);
    return _mapFirebaseUser(credential.user);
  }

  Future<void> signOut() => _authService.signOut();
}
