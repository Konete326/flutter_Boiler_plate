import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_shimmer.dart';
import '../../../../theme/app_spacing.dart';
import '../../data/repositories/notifications_repository.dart';
import '../providers/notifications_provider.dart';
import '../widgets/notification_tile.dart';
import '../widgets/notifications_empty.dart';

class NotificationsScreen extends HookConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsState = ref.watch(notificationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: notificationsState.when(
        data: (notifications) {
          if (notifications.isEmpty) {
            return const NotificationsEmpty();
          }
          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return NotificationTile(
                notification: notification,
                onTap: () {
                  if (!notification.isRead) {
                    ref.read(notificationsRepositoryProvider).markAsRead(notification.id);
                  }
                },
              );
            },
          );
        },
        loading: () => ListView.builder(
          itemCount: 5,
          padding: const EdgeInsets.all(kSpace16),
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.only(bottom: kSpace16),
            child: AppShimmer(width: double.infinity, height: 80),
          ),
        ),
        error: (error, stack) => AppErrorWidget(message: error.toString()),
      ),
    );
  }
}
