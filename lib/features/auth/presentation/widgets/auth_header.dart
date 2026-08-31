import 'package:flutter/material.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_style.dart';

/// Shared title + subtitle block used at the top of Login and Register.
class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyle.headingLarge()),
        const SizedBox(height: AppSpacing.xxs),
        Text(subtitle, style: AppTextStyle.caption()),
      ],
    );
  }
}
