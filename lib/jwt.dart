import 'package:get/get.dart';

class Jwt {
  static final _token = RxString();
  static String get token => _token.value;
  static set token(String val) {
    _token.value = val;
  }
}
