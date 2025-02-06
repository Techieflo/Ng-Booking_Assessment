import 'package:assessment/controllers/auth_controller.dart';
import 'package:assessment/views/password_reset_email.dart';
import 'package:assessment/views/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final AuthController authController = Get.put(AuthController());

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Image.asset(
              "assets/images/lock.png",
              height: 100,
              width: 100,
            )),
            const Text(
              "Forgot Password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Text(
                "Be rest assured! It happens. Please enter your \nemail linked to your account."),
            const SizedBox(height: 30),

            // Email Input Field
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        spreadRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: const TextStyle(fontFamily: "SFPro"),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 100),

            // Continue Button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              height: 50,
              decoration: BoxDecoration(
                color: HexColor("#E8EBED"),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: InkWell(
                onTap: () async {
                  String email = emailController.text.trim();

                  if (!GetUtils.isEmail(email)) {
                    Get.snackbar(
                        "Invalid Email", "Please enter a valid email address",
                        backgroundColor: Colors.red, colorText: Colors.white);
                    return;
                  }

                  try {
                    authController.email.value = email;
                    await authController.forgotPassword();
                  } catch (e) {
                    Get.snackbar("Error", "Something went wrong. Try again.",
                        backgroundColor: Colors.red, colorText: Colors.white);
                    debugPrint("Forgot Password Error: $e");
                  }
                },
                child: const Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "SFPro",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Login Redirection
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Remember your login details? ",
                  style: TextStyle(fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      () => Signin(),
                      transition: Transition.fade,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                  child: Text("Log In",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: HexColor("#000080"),
                          fontSize: 16,
                          color: HexColor("#000080"),
                          fontFamily: "SFPro",
                          fontWeight: FontWeight.w800)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
