import 'package:assessment/controllers/auth_controller.dart';
import 'package:assessment/views/dashboard.dart';
import 'package:assessment/views/forgot%20password.dart';
import 'package:assessment/views/sign_up.dart';
import 'package:assessment/views/subwidgets/signinrow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  final AuthController userController = Get.put(AuthController());

  // TextEditingControllers for email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 13.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/pattern-correct.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                "Welcome Back!",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#111827")),
              ),
              const SizedBox(height: 10),
              const Text("Book services Effortlessly"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),

                      // Email Field
                      _buildTextField(
                        controller: emailController,
                        label: "Email",
                        onChanged: (value) =>
                            userController.email.value = value,
                      ),

                      const SizedBox(height: 10),

                      // Password Field
                      _buildTextField(
                        controller: passwordController,
                        label: "Password",
                        obscureText: true,
                        onChanged: (value) =>
                            userController.password.value = value,
                      ),

                      // Forgot Password Link
                      _buildForgotPasswordLink(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(() => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text("Remeber me"),
                    value: userController.isChecked.value,
                    onChanged: (value) {
                      userController.isChecked.value = value ?? false;
                    },
                  )),

              SizedBox(
                height: 20,
              ),
              // Login Button
              _buildLoginButton(),

              const SizedBox(height: 20),

              // Sign Up Link
              _buildSignUpLink(),

              const SizedBox(height: 20),

              // Divider and "or"
              _buildDividerAndOr(),

              const SizedBox(height: 10),

              // Logos Row
              LogosRow(),
            ],
          ),
        ),
      ),
    );
  }

  // Text Field Builder for Email and Password
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
            controller: controller,
            maxLines: 1,
            obscureText: obscureText,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: label,
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
    );
  }

  // Forgot Password Link
  Widget _buildForgotPasswordLink() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Get.to(() => ForgotPassword(),
                  transition: Transition.circularReveal);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "forgot password?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Login Button
  Widget _buildLoginButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      height: 50,
      decoration: BoxDecoration(
        color: HexColor("#000080"),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: GestureDetector(
        onTap: () {
          userController.login();
        },
        child: const Center(
          child: Text(
            "Log in",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: "SFPro"),
          ),
        ),
      ),
    );
  }

  // Sign Up Link
  Widget _buildSignUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? ", style: TextStyle(fontSize: 16)),
        InkWell(
          onTap: () {
            Get.to(() => Signup(),
                transition: Transition.fade,
                duration: const Duration(milliseconds: 500));
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: HexColor("#000080"),
              fontSize: 16,
              color: HexColor("#000080"),
              fontFamily: "SFPro",
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  // Divider and "or" Section
  Widget _buildDividerAndOr() {
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(color: Colors.black, height: 1.1),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 0),
            color: Colors.white,
            child: const Text("or", style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }
}
