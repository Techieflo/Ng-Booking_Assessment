import 'package:assessment/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class PasswordOnboarding extends StatelessWidget {
  const PasswordOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            Image.asset(
              "assets/images/reset.png",
              height: 300,
              width: 300,
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              height: 50,
              decoration: BoxDecoration(
                color: HexColor("#000080"),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ChangePassword(), transition: Transition.fadeIn);
                },
                child: const Center(
                    child: Text(
                  "Create New Password",
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, fontFamily: "SFPro"),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//final change password screen
class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final AuthController Controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Text(
              "Create a New password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Kindly ensure your password entails the following.",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              isThreeLine: false,
              dense: false,
              leading: Icon(
                Icons.circle,
                size: 12,
                color: HexColor("#7E0140"),
              ), // Bullet icon
              title: const Text('Minimum of eight characters long'),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.circle,
                size: 12,
                color: HexColor("#7E0140"),
              ),
              title: Text('Must contain a symbol e.g @'),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.circle,
                size: 12,
                color: HexColor("#7E0140"),
              ),
              title: Text('Must contain alphanumeric characters e.g abc123'),
            ),
            SizedBox(
              height: 10,
            ),
            //password
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 55,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors
                        .white, // Ensure the container has a background color
                    boxShadow: const [
                      BoxShadow(
                        color: Colors
                            .black26, // Slightly darker for better visibility
                        blurRadius: 6, // Increase for a smoother effect
                        spreadRadius: 1, // Add slight spread
                        offset:
                            Offset(0, 3), // Shift downward for a natural effect
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: TextFormField(
                    maxLines: 1,
                    onChanged: (value) => Controller.password.value = value,
                    obscureText: true,
                    obscuringCharacter: ".",
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility_off_rounded,
                          color: Colors.black,
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(fontFamily: "SFPro"),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        focusedBorder: InputBorder.none),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Confirm password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 55,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors
                        .white, // Ensure the container has a background color
                    boxShadow: const [
                      BoxShadow(
                        color: Colors
                            .black26, // Slightly darker for better visibility
                        blurRadius: 6, // Increase for a smoother effect
                        spreadRadius: 1, // Add slight spread
                        offset:
                            Offset(0, 3), // Shift downward for a natural effect
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: TextFormField(
                    maxLines: 1,
                    onChanged: (value) =>
                        Controller.confirmPassword.value = value,
                    obscureText: true,
                    obscuringCharacter: ".",
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility_off_rounded,
                          color: Colors.black,
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: const TextStyle(fontFamily: "SFPro"),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        focusedBorder: InputBorder.none),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: GestureDetector(
                onTap: () {
                  Controller.resetPassword(Controller.otp.value);
                },
                child: const Center(
                    child: Text(
                  "Reset Password and sign in",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "SFPro",
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
