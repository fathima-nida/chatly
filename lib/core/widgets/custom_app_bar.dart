import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

/// Generic app bar used by simple screens.
///
/// The chat screen uses its own richer app bar (avatar + name), but
/// this one covers the Home screen and any future simple screens.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppTextStyle.headingMedium(color: AppColors.white)),
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
      backgroundColor:AppColors.primary,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: AppColors.border),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}
