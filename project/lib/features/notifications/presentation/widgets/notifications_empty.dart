import 'package:flutter/material.dart';
import '../../../../shared/widgets/app_empty_state.dart';

class NotificationsEmpty extends StatelessWidget {
  const NotificationsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppEmptyState(
      icon: Icons.notifications_none,
      title: 'No Notifications',
      subtitle: 'You are all caught up! Check back later for updates.',
    );
  }
}
