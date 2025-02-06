import 'dart:async';

import 'package:assessment/apis/apicalls.dart';
import 'package:assessment/controllers/auth_controller.dart';
import 'package:assessment/controllers/dashboard_controller.dart';
import 'package:assessment/views/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key, required this.token});
  final String token;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardController dashboardController = Get.put(
    DashboardController(),
  );
  final AuthController userController = Get.put(AuthController());

  bool hide = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        hide = false;
      });
    });
    print("hide is $hide");
  }

  @override
  Widget build(BuildContext context) {
    dashboardController.fetchDashboardData();
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        onTap: (int) {
          Get.snackbar("Build in Progress", "coming soon...");
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About me'),
        ],
        selectedItemColor: HexColor("#000080"),
        unselectedItemColor: Colors.grey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ease',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      "assets/images/easeLogo.png",
                      width: 50,
                      height: 50,
                    ),
                    const Icon(Icons.notifications, color: Colors.white),
                  ],
                ),
                const Divider(
                  color: Colors.white,
                ),
                Center(
                  child: Text(
                    "Welcome back ${widget.token}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Total Earning',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                Skeletonizer(
                  enabled: hide,
                  child: const Text(
                    '\$30,050.56',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue),
                  child: const Text('Withdraw'),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Quick Access',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _quickAccessButton(Icons.book, 'Bookings'),
                  _quickAccessButton(Icons.account_balance_wallet, 'Finance'),
                  _quickAccessButton(Icons.message, 'Messages'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Past bookings',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                InkWell(
                    onTap: () {
                      Get.snackbar(
                          "All Bookings", "These are all you got for now!",
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.blueAccent);
                    },
                    child: Text('See all',
                        style: TextStyle(color: HexColor("#000080")))),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 3,
              itemBuilder: (context, index) {
                return _bookingCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickAccessButton(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        Get.snackbar("Build in progress", "Feature launching soonest....",
            snackPosition: SnackPosition.BOTTOM);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            children: [
              Icon(icon, color: Colors.black, size: 30),
              const SizedBox(height: 5),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bookingCard() {
    return Skeletonizer(
      enabled: hide,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              showEventDetails(context);
            },
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Container(
                      height: 100,

                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://s3-alpha-sig.figma.com/img/54fb/cd42/a0de5d92b4bc4f18ea9c3a96c34f1b8b?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=UlyCshyP2wQhkjoO3hLi~m2UfdJxSuvLgoVBlPiSyZBW-Vu63-d9jddLUJCUM3L8i5JM8nKo9xiioBqB9Wg-DsgqqPEl8rYh9lNYUDKWrE7PT8DBierTnL5lm6UlhgS075oMvF7wQx6F4tsyegXAr0GB~Jj~KJJ0VbTli9B36lbYfOl3o~QHWCPP3Ka-inNslCouKs~pHC9gzFZqSOK-Fs39HfeuzGgqFoaVbUW17lpPgl1g9sAgUWNCPLUkLAm5lB2ndeCMHTPzcaXi5e0VjIjf58vHfArri6jUkWlWj75jNiu7r1qJm22E8mHenr9RdHtNQy0n2Dl~4Sb~290GrA__',
                          ),
                        ),
                      ),
                      // child: Image.network(
                      //   'https://s3-alpha-sig.figma.com/img/54fb/cd42/a0de5d92b4bc4f18ea9c3a96c34f1b8b?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=UlyCshyP2wQhkjoO3hLi~m2UfdJxSuvLgoVBlPiSyZBW-Vu63-d9jddLUJCUM3L8i5JM8nKo9xiioBqB9Wg-DsgqqPEl8rYh9lNYUDKWrE7PT8DBierTnL5lm6UlhgS075oMvF7wQx6F4tsyegXAr0GB~Jj~KJJ0VbTli9B36lbYfOl3o~QHWCPP3Ka-inNslCouKs~pHC9gzFZqSOK-Fs39HfeuzGgqFoaVbUW17lpPgl1g9sAgUWNCPLUkLAm5lB2ndeCMHTPzcaXi5e0VjIjf58vHfArri6jUkWlWj75jNiu7r1qJm22E8mHenr9RdHtNQy0n2Dl~4Sb~290GrA__',
                      //   height: 100,
                      //   width: double.infinity,
                      // ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Laxad Hotels',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text('1, Address St, Lagos'),
                        Text('Sun 2nd - Tue 5th June - 3 Nights',
                            style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 5),
                        Text('✔ Free breakfast'),
                        Text('✔ Free cancellation before 18:00 on 3rd June'),
                        SizedBox(height: 5),
                        Text('Total: NGN35,000',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Confirmed',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showEventDetails(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Laxad Hotels",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://s3-alpha-sig.figma.com/img/54fb/cd42/a0de5d92b4bc4f18ea9c3a96c34f1b8b?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=UlyCshyP2wQhkjoO3hLi~m2UfdJxSuvLgoVBlPiSyZBW-Vu63-d9jddLUJCUM3L8i5JM8nKo9xiioBqB9Wg-DsgqqPEl8rYh9lNYUDKWrE7PT8DBierTnL5lm6UlhgS075oMvF7wQx6F4tsyegXAr0GB~Jj~KJJ0VbTli9B36lbYfOl3o~QHWCPP3Ka-inNslCouKs~pHC9gzFZqSOK-Fs39HfeuzGgqFoaVbUW17lpPgl1g9sAgUWNCPLUkLAm5lB2ndeCMHTPzcaXi5e0VjIjf58vHfArri6jUkWlWj75jNiu7r1qJm22E8mHenr9RdHtNQy0n2Dl~4Sb~290GrA__',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Icon(Icons.location_on, color: HexColor("#000080")),
                  const SizedBox(width: 8),
                  const Text("1, Address St, Lagos",
                      style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.calendar_today, color: HexColor("#000080")),
                  const SizedBox(width: 8),
                  const Text("Sun 2nd - Tue 5th June (3 Nights)",
                      style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.attach_money, color: HexColor("#000080")),
                  const SizedBox(width: 8),
                  const Text("Total: NGN35,000",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "Hotel Features",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 5),
                  Text("Free Breakfast"),
                ],
              ),
              const SizedBox(height: 5),
              const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 5),
                  Text("Free Cancellation before 18:00 on 3rd June"),
                ],
              ),
              const SizedBox(height: 5),
              const Row(
                children: [
                  Icon(Icons.wifi, color: Colors.green),
                  SizedBox(width: 5),
                  Text("Free WiFi"),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    Get.snackbar(
                        'Booking Confirmed', "Your reservation has been made!",
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor("#000080"),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Book Now',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }
}
