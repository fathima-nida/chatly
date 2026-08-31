import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_style.dart';

/// Bottom composer bar: emoji button, rounded text field, send button.
///
/// Purely presentational — `onSend` is called with the trimmed text
/// whenever the user taps send or submits via the keyboard.
class ChatInputField extends StatefulWidget {
  final ValueChanged<String> onSend;

  const ChatInputField({super.key, required this.onSend});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final hasText = _controller.text.trim().isNotEmpty;
      if (hasText != _hasText) setState(() => _hasText = hasText);
    });
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSend(text);
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.sm,
          AppSpacing.xs,
          AppSpacing.sm,
          AppSpacing.xs,
        ),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: Row(
          children: [
            // SizedBox(width: AppSpacing.xxs),
            Icon(Icons.emoji_emotions_outlined, color: AppColors.textSecondary),
            SizedBox(width: AppSpacing.xxs),
            Expanded(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 120),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                // padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                child: TextField(
                  controller: _controller,
                  minLines: 1,
                  maxLines: 5,
                  textCapitalization: TextCapitalization.sentences,
                  style: AppTextStyle.body(),
                  onSubmitted: (_) => _submit(),
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    hintStyle: AppTextStyle.body(
                      color: AppColors.textSecondary,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.sm,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.xxs),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  _hasText ? Icons.send_rounded : Icons.mic_none_rounded,
                  color: AppColors.white,
                ),
                onPressed: _hasText ? _submit : () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
