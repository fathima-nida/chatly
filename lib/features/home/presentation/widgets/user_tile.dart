import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constents/app_constent.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/avatar_widget.dart';

/// A single conversation row on the Home screen: avatar, name, email,
/// last message preview, timestamp, and an unread badge.
class UserTile extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const UserTile({super.key, required this.user, required this.onTap});

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final isToday = now.difference(time).inHours < 24 && now.day == time.day;
    if (isToday) return DateFormat('h:mm a').format(time);
    final isThisWeek = now.difference(time).inDays < 7;
    if (isThisWeek) return DateFormat('EEE').format(time);
    return DateFormat('MMM d').format(time);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Row(
              children: [
                AvatarWidget(
                  imageUrl: user.avatarUrl,
                  fallbackInitial: user.name.substring(0, 1),
                  radius: AppConstants.avatarRadiusMedium,
                  showOnlineDot: user.isOnline,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              user.name,
                              style: AppTextStyle.bodyMedium(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            _formatTime(user.lastMessageTime),
                            style: AppTextStyle.small(
                              color: user.unreadCount > 0
                                  ? AppColors.primary
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        user.email,
                        style: AppTextStyle.small(),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              user.lastMessage,
                              style: AppTextStyle.caption(
                                color: user.unreadCount > 0
                                    ? AppColors.textPrimary
                                    : AppColors.textSecondary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (user.unreadCount > 0) ...[
                            const SizedBox(width: AppSpacing.xs),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 2,
                              ),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(minWidth: 20),
                              child: Text(
                                '${user.unreadCount}',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.small(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
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
