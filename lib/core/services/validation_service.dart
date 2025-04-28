class ValidationService{

  static String? isUserNameValid(String userName) {
    if (userName.isEmpty) {
      return 'Username can\'t be Empty';
    }
    else if (userName.length > 30) {
      return 'Username can\'t be larger than 30 letter';
    }
    else if (userName.length < 2) {
      return 'Username can\'t be less than 2 letter';
    }

    return null;
  }

  static String? isPasswordValid(String password) {
    if (password.isEmpty) {
      return 'Password can\'t be Empty';
    }
    else if (password.length > 50) {
      return 'Password can\'t be larger than 50 digit';
    }
    else if (password.length < 6) {
      return 'Password can be at least 6 digit';
    }
    return null;
  }

  static String? isMobileNumberValid(String mobileNumber) {
    if (mobileNumber.isEmpty) {
      return 'Mobile Number can\'t be Empty';
    }
    else if (mobileNumber.length > 11) {
      return 'Mobile Number can\'t be larger than 11 digits';
    }
    else if (mobileNumber.length <11) {
      return 'Mobile Number can\'t be less than 11 digits';
    }
    return null;
  }


  static String? matchPassword({required String value, required String password}) {
    if (value.isEmpty) {
      return 'Confirm password can\'t be empty';
    }
    else if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? isEmailValid(String email) {
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      return null;
    } else {
      return 'Enter a valid email';
    }
  }

}