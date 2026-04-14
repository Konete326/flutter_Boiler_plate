import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repositories/notifications_repository.dart';
import '../../domain/models/notification_model.dart';

final notificationsProvider = StreamProvider<List<NotificationModel>>((ref) {
  final repository = ref.watch(notificationsRepositoryProvider);
  return repository.watchNotifications();
});
