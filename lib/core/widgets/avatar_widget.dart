import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Circular network avatar with a graceful fallback and an optional
/// online-status dot.
class AvatarWidget extends StatelessWidget {
  final String imageUrl;
  final String fallbackInitial;
  final double radius;
  final bool showOnlineDot;

  const AvatarWidget({
    super.key,
    required this.imageUrl,
    required this.fallbackInitial,
    this.radius = 24,
    this.showOnlineDot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: AppColors.primaryLight,
          backgroundImage: NetworkImage(imageUrl),
          onBackgroundImageError: (_, __) {},
          child: Text(
            fallbackInitial.toUpperCase(),
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: radius * 0.7,
            ),
          ),
        ),
        if (showOnlineDot)
          Positioned(
            right: -1,
            bottom: -1,
            child: Container(
              width: radius * 0.4,
              height: radius * 0.4,
              decoration: BoxDecoration(
                color: AppColors.online,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.surface, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
