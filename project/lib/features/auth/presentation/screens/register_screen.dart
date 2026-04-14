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

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

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
                        title: 'Create Account', 
                        subtitle: 'Get started for free',
                      ),
                      AppTextField(
                        label: 'Email', 
                        controller: emailController,
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
                        text: 'Sign Up', 
                        isLoading: isLoading.value,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            isLoading.value = true;
                            try {
                              await ref.read(authRepositoryProvider).signUp(
                                    emailController.text,
                                    passwordController.text,
                                  );
                            } finally {
                              isLoading.value = false;
                            }
                          }
                        },
                      ),
                      AuthFooter(
                        message: 'Already have an account?',
                        actionLabel: 'Sign In',
                        onAction: () => context.go(RouteConstants.login),
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
