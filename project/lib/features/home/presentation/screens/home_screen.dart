import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          IconButton(
            icon: Icon(
              ref.watch(themeProvider) == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () => ref.read(themeProvider.notifier).toggle(),
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => context.push(RouteConstants.notifications),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push(RouteConstants.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to ${AppConstants.appName}!',
              style: kHeadingM,
            ),
            const SizedBox(height: kSpace24),
            SizedBox(
              width: 200,
              child: AppButton(
                text: 'View Profile',
                isSecondary: true,
                onPressed: () => context.push(RouteConstants.profile),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
