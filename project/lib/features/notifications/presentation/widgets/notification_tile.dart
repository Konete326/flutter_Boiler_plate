import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';
import '../../domain/models/notification_model.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
  });

  final NotificationModel notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kSpace16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: kBorderDark),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: kSpace12,
              height: kSpace12,
              margin: const EdgeInsets.only(top: kSpace4, right: kSpace16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: notification.isRead ? kTransparent : kPrimary,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: kHeadingS.copyWith(color: kTextPrimary),
                  ),
                  const SizedBox(height: kSpace4),
                  Text(
                    notification.body,
                    style: kBodyM.copyWith(color: kTextSecondary),
                  ),
                  const SizedBox(height: kSpace8),
                  Text(
                    DateTime.fromMillisecondsSinceEpoch(notification.createdAt)
                        .toString()
                        .substring(0, 16),
                    style: kLabelS.copyWith(color: kTextDisabled),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
