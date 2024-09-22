mixin InputValidationMixin {
  bool isEmptyValid(dynamic value) {
    if (value == null) {
      return false;
    } else if (value.runtimeType == String) {
      return value.isEmpty ? false : true;
    }
    return true;
  }

  bool isEmailValid(String? email) {
    if (email == null) return true;
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    return regex.hasMatch(email);
  }

  bool isPasswordValid(String? password) {
    if (password == null) return false;
    Pattern pattern = r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[-+_!@#$%^&*.,?]){1,})(?!.*\s).{8,}$';
    RegExp regex = RegExp(pattern as String);
    return regex.hasMatch(password);
  }
}
