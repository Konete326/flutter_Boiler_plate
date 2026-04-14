import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_spacing.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../home/presentation/providers/theme_provider.dart';
import '../widgets/settings_section.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: kSpace16),
        child: Column(
          children: [
            SettingsSection(
              title: 'Appearance',
              tiles: [
                SettingsTile(
                  label: 'Dark Mode',
                  leadingIcon: Icons.dark_mode,
                  trailingWidget: Switch(
                    value: themeMode == ThemeMode.dark,
                    onChanged: (val) => ref.read(themeProvider.notifier).toggle(),
                    activeTrackColor: kPrimary,
                  ),
                ),
              ],
            ),
            SettingsSection(
              title: 'Account',
              tiles: [
                SettingsTile(
                  label: 'Edit Profile',
                  leadingIcon: Icons.person,
                  onTap: () => context.push(RouteConstants.profile),
                ),
                SettingsTile(
                  label: 'Notifications',
                  leadingIcon: Icons.notifications,
                  onTap: () => context.push(RouteConstants.notifications),
                ),
              ],
            ),
            const SettingsSection(
              title: 'About',
              tiles: [
                SettingsTile(
                  label: 'Version',
                  subtitle: AppConstants.appVersion,
                  leadingIcon: Icons.info_outline,
                ),
                SettingsTile(
                  label: 'App Name',
                  subtitle: AppConstants.appName,
                  leadingIcon: Icons.app_shortcut,
                ),
              ],
            ),
            SettingsSection(
              title: 'Danger Zone',
              tiles: [
                SettingsTile(
                  label: 'Logout',
                  leadingIcon: Icons.logout,
                  labelColor: kError,
                  iconColor: kError,
                  onTap: () {
                    ref.read(authRepositoryProvider).signOut();
                    context.go(RouteConstants.login);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
