import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constents/app_constent.dart';
import '../../../../core/models/message_models.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_style.dart';

/// A single chat message bubble.
///
/// Sent messages are blue, right-aligned, white text.
/// Received messages are grey, left-aligned, dark text.
/// Fades and slides in on first build for a subtle entrance animation.
class ChatBubble extends StatefulWidget {
  final MessageModel message;

  const ChatBubble({super.key, required this.message});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppConstants.bubbleAnimationDuration,
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: Offset(0, widget.message.isSentByMe ? 0.08 : -0.08),
      end: Offset.zero,
    ).animate(_fade);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMe = widget.message.isSentByMe;
    final bubbleColor = isMe ? AppColors.sentMessage : AppColors.receivedMessage;
    final textColor =
        isMe ? AppColors.sentMessageText : AppColors.receivedMessageText;

    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(AppSpacing.radiusMd),
                topRight: const Radius.circular(AppSpacing.radiusMd),
                bottomLeft: Radius.circular(isMe ? AppSpacing.radiusMd : 4),
                bottomRight: Radius.circular(isMe ? 4 : AppSpacing.radiusMd),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.message.text,
                  style: AppTextStyle.body(color: textColor),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateFormat('h:mm a').format(widget.message.time),
                      style: AppTextStyle.small(
                        color: isMe
                            ? AppColors.white.withValues(alpha: 0.75)
                            : AppColors.textSecondary,
                      ),
                    ),
                    if (isMe) ...[
                      const SizedBox(width: 4),
                      Icon(
                        widget.message.isRead
                            ? Icons.done_all_rounded
                            : Icons.done_rounded,
                        size: 14,
                        color: widget.message.isRead
                            ? AppColors.success
                            : AppColors.white.withValues(alpha: 0.75),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
