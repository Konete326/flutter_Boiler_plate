import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../theme/app_spacing.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_footer.dart';

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(kSpace24),
          child: Column(
            children: [
              const AuthHeader(title: 'Create Account', subtitle: 'Get started for free'),
              AppTextField(label: 'Email', controller: emailController),
              const SizedBox(height: kSpace16),
              AppTextField(label: 'Password', controller: passwordController, obscureText: true),
              const SizedBox(height: kSpace32),
              AppButton(text: 'Sign Up', onPressed: () {}),
              AuthFooter(
                message: 'Already have an account?',
                actionLabel: 'Sign In',
                onAction: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
