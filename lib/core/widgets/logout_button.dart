import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// AppBar action that shows a confirmation dialog before logging out.
///
/// Hook `onConfirmLogout` up to real Firebase Auth sign-out logic later.
class LogoutButton extends StatelessWidget {
  final VoidCallback onConfirmLogout;

  const LogoutButton({super.key, required this.onConfirmLogout});

  Future<void> _handleTap(BuildContext context) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Log out'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      onConfirmLogout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Log out',
      icon: const Icon(Icons.logout_rounded,color: AppColors.white,),
      onPressed: () => _handleTap(context),
    );
  }
}
