class InputValidator {

  static String? passwordValidator(value) {
                  if (value == null || value.isEmpty)
                    return 'Enter your password';
                  if (value.length < 6) return 'Weak password';
                  return null;
                }

                static String? phoneValidator(value) {
                  if (value == null || value.isEmpty) {
                    return "Enter phone number";
                  }
                  if (value.length < 9) {
                    return "Too short";
                  }
                  if (value.length > 11) {
                    return "Invalid number";
                  }
                  return null;
                }
                static String? confirmPasswordValidator(value, password) {
                  if (value == null || value.isEmpty)
                    return 'Enter your password';
                  if (value != password)
                    return 'Passwords do not match';
                  return null;
                } 
                
}