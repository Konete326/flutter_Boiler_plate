import 'package:firebase_database/firebase_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../domain/models/notification_model.dart';

final notificationsRepositoryProvider = Provider<NotificationsRepository>((ref) {
  final authState = ref.watch(authStateProvider);
  return NotificationsRepository(
    database: FirebaseDatabase.instance,
    uid: authState.value?.uid,
  );
});

class NotificationsRepository {
  NotificationsRepository({
    required FirebaseDatabase database,
    required String? uid,
  })  : _database = database,
        _uid = uid;

  final FirebaseDatabase _database;
  final String? _uid;

  DatabaseReference get _notificationsRef {
    if (_uid == null) throw Exception('User not authenticated');
    return _database.ref().child('notifications').child(_uid);
  }

  Stream<List<NotificationModel>> watchNotifications() {
    if (_uid == null) return Stream.value([]);
    
    return _notificationsRef.onValue.map((event) {
      if (!event.snapshot.exists || event.snapshot.value == null) return [];
      
      final data = Map<dynamic, dynamic>.from(event.snapshot.value as Map);
      final notifications = data.entries.map((e) {
        final itemMap = Map<String, dynamic>.from(e.value as Map);
        itemMap['id'] = e.key;
        return NotificationModel.fromJson(itemMap);
      }).toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

      return notifications;
    });
  }

  Future<void> markAsRead(String notificationId) async {
    if (_uid == null) return;
    await _notificationsRef.child(notificationId).update({'isRead': true});
  }
}
