import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_style.dart';

/// Generic empty-state widget shown when a list has no data
/// (e.g. no conversations yet, no search results).
class EmptyWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const EmptyWidget({
    super.key,
    this.title = 'Nothing here yet',
    this.subtitle = 'Start a new conversation to see it here.',
    this.icon = Icons.chat_bubble_outline_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: AppColors.primary),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              style: AppTextStyle.title(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              subtitle,
              style: AppTextStyle.caption(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
