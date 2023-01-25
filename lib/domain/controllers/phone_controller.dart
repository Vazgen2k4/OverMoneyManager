import 'package:flutter/cupertino.dart';

abstract class PhoneController {
  static final codeControllers =
      List.generate(6, (_) => TextEditingController());

  // TODO: Убрать реализацию данного поля класса
  static String verificationId = '';

  static final phoneController = TextEditingController();
  static final nameController = TextEditingController();

  static String _countryCode = '';
  static String get countryCode => _countryCode;

  static set countryCode(String value) {
    final _trimValue = value.trim();
    if (_trimValue.isEmpty) return;

    final _regularTemplate = RegExp(r'\D');
    if (_trimValue.contains(_regularTemplate)) return;

    _countryCode = _trimValue;
  }

  static String get phoneNumber {
    final _phoneNumber = '+$countryCode${phoneController.value.text}';

    return _phoneNumber.replaceAll(' ', '');
  }

  static String get smsCode {
    final _codeInArray = codeControllers.map((item) => item.value.text);

    return _codeInArray.join();
  }

  static void clear() {
    _countryCode = '';
    verificationId = '';
    phoneController.clear();
    // ignore: avoid_function_literals_in_foreach_calls
    codeControllers.forEach((controller) => controller.clear());
  }
}
