part of 'shared.dart';

class AppValidator {
  static phoneNumberValidator(String phoneNumber) {
    Pattern pattern = r'^(^\+62|62|^08)(\d{3,4}-?){2}\d{3,4}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(phoneNumber))
      return false;
    else
      return true;
  }
}
