class ValidationMixin {
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Please provide a valid email to continue';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please provide a password to continue';
    } else if (value.length <= 5) {
      return 'Password must be more than 5 characters';
    }
    return null;
  }
}
