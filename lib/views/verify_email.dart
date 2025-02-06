import 'package:assessment/controllers/verification_controller.dart';
import 'package:assessment/views/subwidgets/backbutton.dart';
import 'package:assessment/views/subwidgets/otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class VerifyEmail extends StatelessWidget {
  VerifyEmail({super.key});
  final EmailVerificationController controller =
      Get.put(EmailVerificationController());
  List<TextEditingController> controllers =
      List.generate(5, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(5, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
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
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Verify It's you",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: HexColor("#111827")),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 22.0),
            child: Row(
              children: [
                Text(
                  "we have sent a code to",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "(****@gmail.com)",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Enter it ",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text("to verify your identity."),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              5,
              (index) {
                return OTPTextField(
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    autoFocus: index == 0,
                    onChanged: (value) {
                      controller.otp[index] = value;
                      if (value.isNotEmpty && index < 4) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            "Resend code (29 Secs)",
            style: TextStyle(
                color: HexColor("#727272"),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )),
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            height: 50,
            decoration: BoxDecoration(
              color: HexColor("#111827"),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: GestureDetector(
              onTap: () {
                controller.verifyEmail();
              },
              child: const Center(
                  child: Text(
                "Verify",
                style: TextStyle(
                    color: Color.fromARGB(255, 190, 178, 178),
                    fontSize: 20,
                    fontFamily: "SFPro"),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
