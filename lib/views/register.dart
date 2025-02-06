import 'package:assessment/controllers/create_account%20controller.dart';
import 'package:assessment/controllers/select_country.dart';
import 'package:assessment/views/reusablewidgets/button.dart';
import 'package:assessment/views/setpin.dart';
import 'package:assessment/views/subwidgets/backbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

final RegistrationController controller = Get.put(RegistrationController());

class Register extends StatelessWidget {
  Register({super.key});
  final CountryController countryController = Get.put(CountryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: backbutton()),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Hey! there, Tell us a bit ",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: HexColor("#111827")),
            ),
            Row(
              children: [
                Text(
                  "about ",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: HexColor("#111827")),
                ),
                Text(
                  "yourself",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: HexColor("#0A6375")),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
                child: Column(
              children: [
                Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Obx(
                    () => TextFormField(
                      initialValue: controller.fullName.value,
                      autofocus: false,
                      onChanged: (value) => controller.fullName.value = value,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Full name',
                        hintStyle: const TextStyle(fontFamily: "SFPro"),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        fillColor: HexColor("#eceff4"),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Obx(
                    () => TextFormField(
                      initialValue: controller.username.value,
                      onChanged: (value) {
                        controller.username.value = value;
                      },
                      autofocus: false,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'User Name',
                        hintStyle: const TextStyle(fontFamily: "SFPro"),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        fillColor: HexColor("#eceff4"),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    countryController.showCountryList();
                  },
                  child: Container(
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: TextFormField(
                      enabled: false,
                      autofocus: false,
                      maxLines: 1,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.arrow_drop_down_rounded),
                        hintText: 'Select Country',
                        hintStyle: const TextStyle(fontFamily: "SFPro"),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        fillColor: HexColor("#eceff4"),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Obx(
                    () => TextFormField(
                      initialValue: controller.password.value,
                      onChanged: (value) {
                        controller.password.value = value;
                      },
                      autofocus: false,
                      maxLines: 1,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.visibility_off_rounded,
                          color: Colors.grey,
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(fontFamily: "SFPro"),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        fillColor: HexColor("#eceff4"),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  height: 50,
                  decoration: BoxDecoration(
                    color: HexColor("#111827").withOpacity(.7),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      controller.registerUser();
                    },
                    child: const Center(
                        child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Color.fromARGB(255, 190, 178, 178),
                          fontSize: 20,
                          fontFamily: "SFPro"),
                    )),
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
