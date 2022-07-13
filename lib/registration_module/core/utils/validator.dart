
class Validator {
  static String? requiredValidator(String? value) {
    if (value!.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value!.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value.trim())) {
      return 'wrong_email';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }

  static confirmPasswordValidator({required String password}) {
    return (value) {
      if (value!.trim().isEmpty) {
        return 'هذا الحقل مطلوب';
      } else if (value!.trim() != password.trim()) {
        return 'no_match';
      }
      return null;
    };
  }

  static String? englishValidator(String? value) {
    if (!RegExp(
        r"^[a-zA-Z\s\d.,،]*$")
        .hasMatch(value!.trim())){
      return 'just_english_letters_are_allowed';
    }
    return null;
  }

  static String? requiredEnglishValidator(String? value) {
    String? requiredValidatorResult = requiredValidator(value);
    if(requiredValidatorResult != null){
      return requiredValidatorResult;
    }
    return englishValidator(value);
  }

  static String? arabicValidator(String? value) {
    if (!RegExp(
        r"^[\u0621-\u064A\s\d.,،]*$")
        .hasMatch(value!.trim())){
      return 'just_arabic_letters_are_allowed';
    }
    return null;
  }

  static String? requiredArabicValidator(String? value) {
    String? requiredValidatorResult = requiredValidator(value);
    if(requiredValidatorResult != null){
      return requiredValidatorResult;
    }
    return arabicValidator(value);
  }

  static String? libyaMobileValidator(String? value) {
    if (!RegExp(
        r"^([0-9]{2}[0-9]{7})?$")
        .hasMatch(value!.trim())){
      return 'رقم الهاتف غير صالح, يجب أن يكون من الشكل 912365478';
    }
    return null;
  }

  static String? requiredLibyaMobileValidator(String? value) {
    String? requiredValidatorResult = requiredValidator(value);
    if(requiredValidatorResult != null){
      return requiredValidatorResult;
    }
    return libyaMobileValidator(value);
  }

  static String? numberValidator(String? value) {
    if (!RegExp(
        r"^[0-9]*$")
        .hasMatch(value!.trim())){
      return 'invalid_value';
    }
    return null;
  }

  static String? requiredNumberValidator(String? value) {
    String? requiredValidatorResult = requiredValidator(value);
    if(requiredValidatorResult != null){
      return requiredValidatorResult;
    }
    return numberValidator(value);
  }

  static String? decimalNumberValidator(String? value) {
    if (!RegExp(r'(^\d*\.?\d*)$')
        .hasMatch(value!.trim())){
      return 'invalid_value';
    }
    return null;
  }

  static String? requiredDecimalNumberValidator(String? value) {
    String? requiredValidatorResult = requiredValidator(value);
    if(requiredValidatorResult != null){
      return requiredValidatorResult;
    }
    return decimalNumberValidator(value);
  }
}