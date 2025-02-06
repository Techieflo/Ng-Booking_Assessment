import 'package:assessment/apis/apicalls.dart';
import 'package:assessment/apis/deviceinfo.dart';
import 'package:assessment/controllers/select_country.dart';
import 'package:assessment/controllers/signup_controllers.dart';
import 'package:assessment/views/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

CountryController ctrller = Get.put(CountryController());
SignUpController ctrl = Get.put(SignUpController());

class RegistrationController extends GetxController {
  var fullName = ''.obs;
  var username = ''.obs;
  var email = ctrl.email;

  var password = ''.obs;
  var device_name = ''.obs;
  var responseMessage = ''.obs;
  @override
  void onInit() {
    setDeviceName();

    super.onInit();
  }

  var country = ctrller.selectedCountry;
  final ApiService apiService = ApiService();

  Future<void> registerUser() async {
    final data = {
      'full_name': fullName.value,
      'username': username.value,
      'email': email.value,
      'country': country.value,
      'password': password.value,
      'device_name': "web",
    };

    final result = await apiService.registerUser(data);
    responseMessage.value = result;
    print(result);
    var isfail = false.obs;
    if (result.contains("email")) {
      isfail.value = true;
    } else {
      isfail.value = false;
    }
    showTokenDialog(result, isfail.value);
  }

  Future<void> setDeviceName() async {
    final deviceName = await DeviceInfoUtil.getDeviceName();
    device_name.value = deviceName;
  }

  void showTokenDialog(String token, bool isfail) {
    Get.dialog(
      CupertinoAlertDialog(
        title:
            Center(child: Text(isfail ? 'Registration failed!' : " Success")),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(token),
            const SizedBox(height: 10),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              isfail
                  ? Get.back()
                  : Get.off(() => Signin(),
                      transition: Transition.rightToLeft); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
