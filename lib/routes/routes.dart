import 'package:get/get.dart';

// to go back in a screen

void back() {
  Get.back();
}

void gotonext(screen) {
  Get.to(((() => screen)));
}
