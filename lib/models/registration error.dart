class RegistrationError {
  final bool status;
  final String message;
  final Map<String, dynamic> errors;

  RegistrationError({
    required this.status,
    required this.message,
    required this.errors,
  });

  factory RegistrationError.fromJson(Map<String, dynamic> json) {
    return RegistrationError(
      status: json['status'],
      message: json['message'],
      errors: json['errors'] != null
          ? Map<String, dynamic>.from(json['errors'])
          : {},
    );
  }

  String getEmailErrorMessage() {
    // Check if 'email' error exists in the errors map
    if (errors.containsKey('email')) {
      // Return the first error message for 'email'
      return errors['email'][0];
    } else {
      return 'Either The password does not contain at least one uppercase and one lowercase letter.';
    }
  }
}
