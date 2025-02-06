import 'package:assessment/controllers/auth_controller.dart';
import 'package:assessment/controllers/signup_controllers.dart';
import 'package:assessment/views/signin_page.dart';
import 'package:assessment/views/subwidgets/backbutton.dart';
import 'package:assessment/views/subwidgets/signinrow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  final AuthController signUpController = Get.put(AuthController());
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
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/pattern-correct.png",
                        ),
                        fit: BoxFit.cover)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor("#111827")),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Form(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "First Name",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
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
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: TextFormField(
                                              autofocus: false,
                                              maxLines: 1,
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              onChanged: (value) =>
                                                  signUpController
                                                      .firstName.value = value,
                                              decoration: InputDecoration(
                                                hintText: 'First name',
                                                hintStyle: const TextStyle(
                                                    fontFamily: "SFPro"),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "Last Name",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
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
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: TextFormField(
                                              autofocus: false,
                                              maxLines: 1,
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              onChanged: (value) =>
                                                  signUpController
                                                      .lastName.value = value,
                                              decoration: InputDecoration(
                                                hintText: 'Last name',
                                                hintStyle: const TextStyle(
                                                    fontFamily: "SFPro"),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Email",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
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
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                      child: TextFormField(
                                        autofocus: false,
                                        maxLines: 1,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        onChanged: (value) => signUpController
                                            .email.value = value,
                                        decoration: InputDecoration(
                                          hintText: 'Email',
                                          hintStyle: const TextStyle(
                                              fontFamily: "SFPro"),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Phone Number",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height: 55,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 10),
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
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(height: 20),
                                          Expanded(
                                            child: IntlPhoneField(
                                              textAlign: TextAlign.center,
                                              decoration: const InputDecoration(
                                                  border: InputBorder.none),
                                              initialCountryCode:
                                                  'NG', // Default to Nigeria (+234)
                                              onChanged: (phone) {
                                                signUpController.phoneNumber
                                                    .value = phone.number;
                                                signUpController
                                                    .selectedCountryCode
                                                    .value = phone.countryCode;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                // Password
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Password",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height: 55,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 10),
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
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                      child: TextFormField(
                                        maxLines: 1,
                                        obscureText: true,
                                        obscuringCharacter: ".",
                                        onChanged: (value) => signUpController
                                            .password.value = value,
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(Icons.lock,
                                              color: Colors.black),
                                          suffixIcon: const Icon(
                                              Icons.visibility_off_rounded,
                                              color: Colors.black),
                                          hintText: 'Password',
                                          hintStyle: const TextStyle(
                                              fontFamily: "SFPro"),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 15),
                                          focusedBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Confirm Password",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height: 55,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 10),
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
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                      child: TextFormField(
                                        maxLines: 1,
                                        obscureText: true,
                                        obscuringCharacter: ".",
                                        onChanged: (value) => signUpController
                                            .confirmPassword.value = value,
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(Icons.lock,
                                              color: Colors.black),
                                          suffixIcon: const Icon(
                                              Icons.visibility_off_rounded,
                                              color: Colors.black),
                                          hintText: 'Confirm Password',
                                          hintStyle: const TextStyle(
                                              fontFamily: "SFPro"),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 15),
                                          focusedBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
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
                            signUpController.signup();
                            // Get.to(() => VerifyEmail());
                          },
                          child: const Center(
                              child: Text(
                            "SIGN UP",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "SFPro"),
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
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
                            child: Text("LogIn",
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
                      const SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Divider(
                              color: Colors.black,
                              height: 1.1,
                            ),
                          ),
                          Center(
                              child: Container(
                                  margin: const EdgeInsets.only(top: 0),
                                  color: Colors.white,
                                  child: const Text(
                                    "or",
                                    style: TextStyle(fontSize: 16),
                                  )))
                        ],
                      ),
                      const Center(
                        child: Text(
                          "Sign up with",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LogosRow(),
                    ]),
              ),
            )));
  }
}
