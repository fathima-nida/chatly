import 'package:flutter/material.dart';
import 'package:messaging_app/core/constents/app_constent.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../auth/presentation/screens/login_screen.dart';

/// Splash screen shown briefly on app start, then fades into Login.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppConstants.fadeAnimationDuration,
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _scale = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _controller.forward();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future.delayed(AppConstants.splashDuration);
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: AppConstants.pageTransitionDuration,
        pageBuilder: (_, animation, __) => const LoginScreen(),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: FadeTransition(
          opacity: _fade,
          child: ScaleTransition(
            scale: _scale,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 96,
                  width: 96,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.15),
                        blurRadius: 24,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.chat_bubble_rounded,
                    color: AppColors.primary,
                    size: 44,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  AppConstants.appName,
                  style: AppTextStyle.headingLarge(color: AppColors.white),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  AppConstants.appTagline,
                  style: AppTextStyle.caption(
                    color: AppColors.white.withValues(alpha: 0.85),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.4,
                    color: AppColors.white.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
