import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_style.dart';

/// A rounded search bar. UI only — wire `onChanged` up to real
/// filtering logic once the user list comes from Firestore.
class SearchField extends StatelessWidget {
  final String hint;
  final ValueChanged<String>? onChanged;

  const SearchField({
    super.key,
    this.hint = 'Search conversations',
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
        border: Border.all(color: AppColors.border),
      ),
      child: TextField(
        onChanged: onChanged,
        style: AppTextStyle.body(),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyle.body(color: AppColors.textSecondary),
          prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
