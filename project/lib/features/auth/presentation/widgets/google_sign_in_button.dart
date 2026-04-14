import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_snackbar.dart';
import '../providers/auth_provider.dart';

class GoogleSignInButton extends HookConsumerWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);

    return AppButton(
      text: 'Continue with Google',
      isSecondary: true,
      isLoading: isLoading.value,
      onPressed: () async {
        isLoading.value = true;
        try {
          await ref.read(authRepositoryProvider).signInWithGoogle();
        } catch (e) {
          if (context.mounted) {
            AppSnackbar.showError(context, e.toString());
          }
        } finally {
          isLoading.value = false;
        }
      },
    );
  }
}
