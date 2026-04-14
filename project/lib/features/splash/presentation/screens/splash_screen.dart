import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../../theme/app_animations.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_spacing.dart';
import '../../../../theme/app_typography.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

class SplashScreen extends StatefulHookConsumerWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _opacity = 1.0);
      _navigateToNextScreen();
    });
  }

  Future<void> _navigateToNextScreen() async {
    await Future<void>.delayed(kDurationSplash);
    if (!mounted) return;

    final authState = ref.read(authStateProvider);
    if (authState.value != null) {
      context.go(RouteConstants.home);
    } else {
      context.go(RouteConstants.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundDark,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: kDurationSlow,
          curve: kCurveDefault,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppConstants.appName,
                style: kHeadingXL.copyWith(color: kTextPrimary),
              ),
              const SizedBox(height: kSpace8),
              Text(
                'Starting up...',
                style: kBodyM.copyWith(color: kTextSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
