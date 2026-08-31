import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Standard centered loading spinner, sized consistently across screens.
class LoadingWidget extends StatelessWidget {
  final double size;
  final Color color;

  const LoadingWidget({
    super.key,
    this.size = 28,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(strokeWidth: 2.6, color: color),
      ),
    );
  }
}
