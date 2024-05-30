class Validator {
  static validateName({required String name}) {
    // ignore: unnecessary_null_comparison
    if (name == null) {
      return null;
    }
    if (name.isEmpty) {
      return 'Name cannot  Empty';
    }
    return null;
  }

  static validateEmail({required String email}) {
    // ignore: unnecessary_null_comparison
    if (email == null) {
      return null;
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.:#$%$'*+/=?^-`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (email.isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }
    return null;
  }

  static validatePassword({required String password}) {
    // ignore: unnecessary_null_comparison
    if (password == null) {
      return null;
    }
    if (password.isEmpty) {
      return 'password cannot be empty';
    } else if (password.length < 6) {
      return 'enter a password with length atleast 6';
    }
    return null;
  }
}
