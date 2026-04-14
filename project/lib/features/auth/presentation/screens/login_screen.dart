import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../theme/app_spacing.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';
import '../widgets/google_sign_in_button.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isLoading = useState(false);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: context.wp(constraints.maxWidth > 600 ? 20 : 6),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const AuthHeader(
                        title: 'Welcome Back',
                        subtitle: 'Sign in to continue',
                      ),
                      AppTextField(
                        label: 'Email',
                        controller: emailController,
                        hintText: 'user@example.com',
                        validator: Validators.email,
                      ),
                      const SizedBox(height: kSpace16),
                      AppTextField(
                        label: 'Password',
                        controller: passwordController,
                        obscureText: true,
                        validator: Validators.password,
                      ),
                      const SizedBox(height: kSpace32),
                      AppButton(
                        text: 'Sign In',
                        isLoading: isLoading.value,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            isLoading.value = true;
                            try {
                              await ref.read(authRepositoryProvider).signIn(
                                    emailController.text,
                                    passwordController.text,
                                  );
                            } finally {
                              isLoading.value = false;
                            }
                          }
                        },
                      ),
                      const SizedBox(height: kSpace16),
                      const GoogleSignInButton(),
                      AuthFooter(
                        message: "Don't have an account?",
                        actionLabel: 'Sign Up',
                        onAction: () => context.go(RouteConstants.register),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
