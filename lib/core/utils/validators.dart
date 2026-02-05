// core/utils/validators.dart
class Validators {
  // 1.Email Validation
  static String? validateEmail(String? value) {
    // Is it empty
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    //  2.Does it look like an email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // 2.Password Validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is Required';
    }
    // check Pass character 6 or more
    if (value.length < 6) {
      return 'Password must be at least 6 character long';
    }
    return null;
  }

  // 3. Name Validation
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is Required';
    }

    // check it only contains letters and spaces
    final nameRegex = RegExp(r'^[a-zA-Z ]+$');

    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a Valid name(letters only)';
    }
    return null;
  }
}
