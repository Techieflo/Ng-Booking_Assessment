import 'package:assessment/views/dashboard.dart';
import 'package:assessment/views/homescreen.dart';
import 'package:assessment/views/reusablewidgets/button.dart';
import 'package:assessment/views/subwidgets/backbutton.dart';
import 'package:assessment/views/subwidgets/verify_pin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class SetPin extends StatelessWidget {
  const SetPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                GestureDetector(
                  child: backbutton(),
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              "Set your PIN Code ",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: HexColor("#111827")),
            ),
            const Text(
              "We use  state-of-the-art security measures to\n protect your information at all times. ",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontFamily: "SFPro"),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                pinTextField(
                  context,
                ),
                pinTextField(
                  context,
                ),
                pinTextField(
                  context,
                ),
                pinTextField(
                  context,
                ),
              ],
            ),
            const SizedBox(
              height: 80,
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
                  // Get.to(() => Dashboard());
                },
                child: const Center(
                    child: Text(
                  "Verify Pin",
                  style: TextStyle(
                      color: Color.fromARGB(255, 190, 178, 178),
                      fontSize: 20,
                      fontFamily: "SFPro"),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
