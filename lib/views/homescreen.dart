// import 'package:assessment/routes/routes.dart';
// import 'package:assessment/views/signin_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';

// class CarouselController extends GetxController {
//   var currentIndex = 0.obs;

//   void updateIndex(int index) {
//     currentIndex.value = index;
//   }
// }

// class CustomIndicator extends StatelessWidget {
//   final CarouselController controller;

//   CustomIndicator({required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     //this section builds the row
//     return Obx(() {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: List.generate(2, (index) {
//           bool isSelected = controller.currentIndex.value == index;
//           return AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             margin: const EdgeInsets.symmetric(horizontal: 5.0),
//             width: isSelected ? 50.0 : 10.0,
//             height: isSelected ? 12.0 : 10.0,
//             decoration: BoxDecoration(
//               color: isSelected ? HexColor("#111827") : Colors.grey,
//               borderRadius: BorderRadius.circular(5.0),
//             ),
//           );
//         }),
//       );
//     });
//   }
// }

// class Homescreen extends StatelessWidget {
//   final CarouselController _controller = Get.put(CarouselController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 30.0),
//             child: GestureDetector(
//               onTap: () {},
//               child: Text(
//                 "Skip",
//                 style: TextStyle(
//                     color: HexColor("#2FA2B9"),
//                     fontSize: 20,
//                     fontFamily: 'SFPro',
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.7,
//               child: PageView.builder(
//                 itemCount: 2, // Number of items in the carousel
//                 onPageChanged: (index) => _controller.updateIndex(index),
//                 itemBuilder: (context, index) {
//                   return Container(
//                       height: MediaQuery.of(context).size.height * 0.5,
//                       // margin: const EdgeInsets.all(10.0),
//                       color: Colors.white,
//                       child: Column(
//                         children: [
//                           Image.asset(
//                             'assets/images/device.png',
//                             fit: BoxFit.cover,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   "Finance app the safest \n     and most trusted",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 24,
//                                       fontFamily: "SFPro"),
//                                 ),
//                                 Container(
//                                   alignment: Alignment.center,
//                                   padding: EdgeInsets.symmetric(horizontal: 20),
//                                   child: const Text(
//                                     "Your finance work starts here. Our here to help you track and deal with speeding up your transactions.",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.normal,
//                                         fontSize: 14,
//                                         fontFamily: "SFPro"),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ));
//                 },
//               ),
//             ),
//             CustomIndicator(controller: _controller),
//             const SizedBox(
//               height: 30,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 50),
//               height: 60,
//               decoration: BoxDecoration(
//                 color: HexColor("#111827"),
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               child: GestureDetector(
//                 onTap: () {
//                   Get.to(() => Signin());
//                 },
//                 child: const Center(
//                     child: Text(
//                   "Get Started",
//                   style: TextStyle(
//                       color: Colors.white, fontSize: 20, fontFamily: "SFPro"),
//                 )),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:assessment/views/sign_up.dart';
import 'package:assessment/views/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:hexcolor/hexcolor.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _controller = PageController();
  final List<String> _backgroundImages = [
    'assets/images/image1.jpeg',
    'assets/images/image2.png',
    'assets/images/image4.jpeg',
    'assets/images/image5.jpeg',
  ];
  final List<String> _titles = [
    "Find Your Perfect Stay",
    "Seamless Booking Experience",
    "Luxury & Comfort Awaits",
    "Reliable Travel & Hospitality",
  ];
  final List<String> _subtitles = [
    "Discover amazing hotels and accommodations at the best prices.",
    "Book hotels, rides, and flights with ease and confidence.",
    "Enjoy top-tier comfort and premium services during your stay.",
    "Trust us for a seamless and enjoyable travel experience.",
  ];

  late AnimationController _animationController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Update both the background and texts every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _backgroundImages.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: Image.asset(
              _backgroundImages[_currentIndex],
              key: ValueKey<int>(_currentIndex),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              // _buildSkipButton(),
              Expanded(
                  child: _buildTextSection()), // Displaying Titles & Subtitles

              _buildActionButtons(),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkipButton() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          Get.to(() => Signup());
        },
        child: const Text(
          "Skip",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildTextSection() {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: Column(
        key: ValueKey<int>(_currentIndex),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _titles[_currentIndex],
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              _subtitles[_currentIndex],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              Get.to(() => Signup());
            },
            child: const Text('Sign Up', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: HexColor("#000080"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              Get.to(() => Signin(), transition: Transition.fadeIn);
            },
            child: const Text('Login', style: TextStyle(color: Colors.black)),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        )
      ],
    );
  }
}
