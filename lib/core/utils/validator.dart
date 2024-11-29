class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    const emailRegex = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    if (!RegExp(emailRegex).hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    const phoneRegex = r'^\+?[0-9]{7,15}$';
    if (!RegExp(phoneRegex).hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    return null;
  }

  static String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateField(String? value, String fieldName, {int minLength = 0}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    if (minLength > 0 && value.length < minLength) {
      return '$fieldName must be at least $minLength characters long';
    }
    return null;
  }

  static String? productQuantityValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Product quantity is required';
    }
    if (int.tryParse(value) == null || int.parse(value) <= 0) {
      return 'Please enter a valid quantity';
    }
    return null;
  }

  static String? productUnitPriceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Product unit price is required';
    }
    if (int.tryParse(value) == null || int.parse(value) <= 0) {
      return 'Please enter a valid price';
    }
    return null;
  }

}
