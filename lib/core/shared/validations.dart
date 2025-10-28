class Validations {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if (value.length < 6) {
      return 'Phone number must be at least 10 digits';
    }
    return null;
  }


  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
