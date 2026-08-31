/// Simple, dependency-free form validators.
class Validators {
  Validators._();

  static final RegExp _emailPattern =
      RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,4}$');

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!_emailPattern.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? password(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    return null;
  }

  static String? confirmPassword(String? value, String original) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != original) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 2) {
      return 'Name is too short';
    }
    return null;
  }

  static String? required(String? value, {String label = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$label is required';
    }
    return null;
  }
}
