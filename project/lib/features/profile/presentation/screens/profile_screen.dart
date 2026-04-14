import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_loading_overlay.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';
import '../providers/profile_provider.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/profile_info_tile.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);
    final isEditing = useState(false);
    final nameController = useTextEditingController(
      text: profileState.value?.name ?? '',
    );

    void openImagePicker() {
      // Storage upload logic — placeholder per TRD
    }

    Future<void> saveProfile() async {
      if (profileState.value == null) return;
      final updated = profileState.value!.copyWith(
        name: nameController.text.trim(),
      );
      await ref.read(profileProvider.notifier).updateProfile(updated);
      isEditing.value = false;
    }

    return AppLoadingOverlay(
      isLoading: profileState.isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: profileState.when(
          data: (profile) {
            if (profile == null) {
              return Center(child: Text('Profile not found', style: kBodyM));
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.all(kSpace24),
              child: Column(
                children: [
                  ProfileAvatar(
                    name: profile.name,
                    photoUrl: profile.photoUrl,
                    onTap: openImagePicker,
                  ),
                  const SizedBox(height: kSpace32),
                  if (isEditing.value) ...[
                    AppTextField(
                      label: 'Name',
                      controller: nameController,
                      hintText: 'Enter your name',
                    ),
                    const SizedBox(height: kSpace24),
                    AppButton(
                      text: 'Save',
                      onPressed: saveProfile,
                    ),
                  ] else ...[
                    ProfileInfoTile(
                      label: 'Name',
                      value: profile.name,
                      icon: Icons.person,
                      showEditIcon: true,
                      onEdit: () => isEditing.value = true,
                    ),
                    const Divider(color: kBorderDark, height: 1),
                  ],
                  ProfileInfoTile(
                    label: 'Email',
                    value: profile.email,
                    icon: Icons.email,
                  ),
                  const Divider(color: kBorderDark, height: 1),
                  ProfileInfoTile(
                    label: 'Member Since',
                    value: DateTime.fromMillisecondsSinceEpoch(profile.createdAt)
                        .toString()
                        .split(' ')[0],
                    icon: Icons.calendar_today,
                  ),
                ],
              ),
            );
          },
          loading: () => const SizedBox(),
          error: (err, stack) => AppErrorWidget(message: err.toString()),
        ),
      ),
    );
  }
}
