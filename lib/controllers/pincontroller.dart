import 'package:get/get.dart';

class PinController extends GetxController {
  var pin = ''.obs;

  void addNumber(String number) {
    if (pin.value.length < 4) {
      pin.value += number;
    }
  }

  void removeNumber() {
    if (pin.isNotEmpty) {
      pin.value = pin.substring(0, pin.value.length - 1);
    }
  }

  void clearPin() {
    pin.value = '';
  }

  String getPin() {
    return pin.value;
  }
}
