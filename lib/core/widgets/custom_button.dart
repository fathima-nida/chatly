import 'package:flutter/material.dart';
import 'package:messaging_app/core/constents/app_constent.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_style.dart';

/// A primary call-to-action button with a subtle press animation,
/// shadow, and an optional loading spinner state.
class CustomButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.icon,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double _scale = 1.0;

  void _setScale(double value) {
    if (widget.onPressed == null || widget.isLoading) return;
    setState(() => _scale = value);
  }

  @override
  Widget build(BuildContext context) {
    final bool disabled = widget.onPressed == null || widget.isLoading;

    return GestureDetector(
      onTapDown: (_) => _setScale(0.97),
      onTapUp: (_) => _setScale(1.0),
      onTapCancel: () => _setScale(1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: AppConstants.buttonPressDuration,
        curve: Curves.easeOut,
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              boxShadow: widget.isOutlined || disabled
                  ? []
                  : [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.28),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
            ),
            child: widget.isOutlined
                ? OutlinedButton(
                    onPressed: disabled ? null : widget.onPressed,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.border),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppSpacing.radiusMd),
                      ),
                    ),
                    child: _buildContent(color: AppColors.textPrimary),
                  )
                : ElevatedButton(
                    onPressed: disabled ? null : widget.onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      disabledBackgroundColor:
                          AppColors.primary.withValues(alpha: 0.5),
                    ),
                    child: _buildContent(color: AppColors.white),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent({required Color color}) {
    if (widget.isLoading) {
      return SizedBox(
        height: 22,
        width: 22,
        child: CircularProgressIndicator(strokeWidth: 2.4, color: color),
      );
    }

    if (widget.icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon, size: 20, color: color),
          const SizedBox(width: AppSpacing.xs),
          Text(widget.label, style: AppTextStyle.button(color: color)),
        ],
      );
    }

    return Text(widget.label, style: AppTextStyle.button(color: color));
  }
}
