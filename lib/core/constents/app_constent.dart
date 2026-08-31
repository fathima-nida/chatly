/// App-wide constants that aren't colors, text styles, or spacing.
class AppConstants {
  AppConstants._();

  static const String appName = 'Chatly';
  static const String appTagline = 'Conversations, simplified.';

  // Durations
  static const Duration splashDuration = Duration(milliseconds: 1800);
  static const Duration fadeAnimationDuration = Duration(milliseconds: 700);
  static const Duration pageTransitionDuration = Duration(milliseconds: 350);
  static const Duration buttonPressDuration = Duration(milliseconds: 120);
  static const Duration bubbleAnimationDuration = Duration(milliseconds: 250);

  // Sizes
  static const double avatarRadiusSmall = 20;
  static const double avatarRadiusMedium = 28;
  static const double avatarRadiusLarge = 44;
}
