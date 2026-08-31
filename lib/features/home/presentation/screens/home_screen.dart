import 'package:flutter/material.dart';
import 'package:messaging_app/core/constents/app_constent.dart';
import 'package:messaging_app/core/constents/dummy_constent.dart';
import 'package:messaging_app/core/models/user_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/logout_button.dart';
import '../../../../core/widgets/search_field.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../../../chat/presentation/screens/chat_screen.dart';
import '../widgets/user_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query = '';

  List<UserModel> get _filteredUsers {
    if (_query.trim().isEmpty) return DummyData.users;
    final q = _query.toLowerCase();
    return DummyData.users
        .where((u) =>
            u.name.toLowerCase().contains(q) ||
            u.email.toLowerCase().contains(q))
        .toList();
  }

  void _handleLogout() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  void _openChat(UserModel user) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: AppConstants.pageTransitionDuration,
        pageBuilder: (_, animation, __) => ChatScreen(user: user),
        transitionsBuilder: (_, animation, __, child) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final users = _filteredUsers;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: AppConstants.appName,
        actions: [LogoutButton(onConfirmLogout: _handleLogout)],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.xs,
              ),
              child: SearchField(
                onChanged: (value) => setState(() => _query = value),
              ),
            ),
            Expanded(
              child: users.isEmpty
                  ? const EmptyWidget(
                      title: 'No conversations found',
                      subtitle: 'Try a different name or email.',
                      icon: Icons.search_off_rounded,
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.xs,
                      ),
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return UserTile(
                          user: user,
                          onTap: () => _openChat(user),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
