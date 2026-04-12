import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../theme/app_spacing.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_footer.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

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
              const AuthHeader(title: 'Welcome Back', subtitle: 'Sign in to continue'),
              AppTextField(label: 'Email', controller: emailController, hintText: 'user@example.com'),
              const SizedBox(height: kSpace16),
              AppTextField(label: 'Password', controller: passwordController, obscureText: true),
              const SizedBox(height: kSpace32),
              AppButton(
                text: 'Sign In',
                onPressed: () => ref.read(authRepositoryProvider).signIn(
                  emailController.text,
                  passwordController.text,
                ),
              ),
              AuthFooter(
                message: "Don't have an account?",
                actionLabel: 'Sign Up',
                onAction: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
