import 'package:flutter/material.dart';
import 'package:messaging_app/core/constents/app_constent.dart';
import 'package:messaging_app/core/constents/dummy_constent.dart';
import 'package:messaging_app/core/models/message_models.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/avatar_widget.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/chat_input_field.dart';

class ChatScreen extends StatefulWidget {
  final UserModel user;

  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _scrollController = ScrollController();
  late List<MessageModel> _messages;

  @override
  void initState() {
    super.initState();
    _messages = DummyData.conversation(widget.user.id);
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _scrollToBottom({bool animate = false}) {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position.maxScrollExtent;
    if (animate) {
      _scrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      _scrollController.jumpTo(position);
    }
  }

  void _handleSend(String text) {
    setState(() {
      _messages.add(
        MessageModel(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          text: text,
          time: DateTime.now(),
          isSentByMe: true,
        ),
      );
    });
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _scrollToBottom(animate: true));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _ChatAppBar(user: widget.user),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(message: _messages[index]);
                },
              ),
            ),
            ChatInputField(onSend: _handleSend),
          ],
        ),
      ),
    );
  }
}

/// Chat-specific app bar showing the other user's avatar, name, and
/// online status alongside the back button.
class _ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final UserModel user;

  const _ChatAppBar({required this.user});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: AppColors.border),
      ),
      title: Row(
        children: [
          AvatarWidget(
            imageUrl: user.avatarUrl,
            fallbackInitial: user.name.substring(0, 1),
            radius: AppConstants.avatarRadiusSmall,
            showOnlineDot: user.isOnline,
          ),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: AppTextStyle.bodyMedium(),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  user.isOnline ? 'Online' : user.phone.toString(),
                  style: AppTextStyle.small(
                    color: user.isOnline
                        ? AppColors.success
                        : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.call_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert_rounded),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}
