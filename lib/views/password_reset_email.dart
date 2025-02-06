import 'package:assessment/controllers/auth_controller.dart';
import 'package:assessment/controllers/verification_controller.dart';
import 'package:assessment/views/confirm_change_password.dart';
import 'package:assessment/views/subwidgets/otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ResetEmail extends StatelessWidget {
  ResetEmail({super.key});

  final EmailVerificationController controller =
      Get.put(EmailVerificationController());
  final AuthController authcontroller = Get.put(AuthController());
  final List<TextEditingController> controllers =
      List.generate(5, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(5, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Image.asset("assets/images/mail.png", height: 100, width: 100),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Check your Inbox!!",
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
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    softWrap: true,
                    ''' We have just sent an E-mail that contains the instructions\n and a reset link to your mail (***@gmail.com)''',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text("Enter Verification code",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                5,
                (index) {
                  return OTPTextField(
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    autoFocus: index == 0,
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 4) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 100),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            height: 50,
            decoration: BoxDecoration(
              color: HexColor("#111827"),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: GestureDetector(
              onTap: () {
                String otp = controllers.map((c) => c.text).join();
                authcontroller.otp.value = otp;
                print(authcontroller.otp.value);
                if (otp.length < 5) {
                  Get.snackbar("Error", "Please enter the full OTP",
                      backgroundColor: Colors.red, colorText: Colors.white);
                  return;
                }

                Get.to(() => PasswordOnboarding());
              },
              child: const Center(
                child: Text(
                  "Verify",
                  style: TextStyle(
                      color: Color.fromARGB(255, 190, 178, 178),
                      fontSize: 20,
                      fontFamily: "SFPro"),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text("Didn't receive otp code?",
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextButton(
            onPressed: () {},
            child: Text("Resend Verification Code",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: HexColor("#000080"))),
          )
        ],
      ),
    );
  }
}
