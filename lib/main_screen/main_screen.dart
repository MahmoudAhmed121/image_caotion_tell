import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_booking/constants/colors.dart';
import 'package:restaurant_booking/main_screen/account_screen.dart';
import 'package:restaurant_booking/main_screen/hestory.dart';
import 'package:restaurant_booking/main_screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isIERNET = false;

  @override
  void initState() {
    super.initState();

    final subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          isIERNET = false;
        });
      } else {
        setState(() {
          isIERNET = true;
        });
      }
    });
  }

  int currentIndex = 0;
  List listOfScreens = [
    HomeScreen(),
    History(),
    TeamScreen(),
  ];

  Widget build(BuildContext context) {
    if (isIERNET == false) {
      return SafeArea(
        child: Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "animations/9293-not-signal-no-internet-access-and-connection-lost-placeholder (1).json",
                height: 400,
                width: 400,
              ),
            ],
          )),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 70,
        color:Mycolor.primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GNav(
            backgroundColor: Mycolor.primaryColor,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(170, 114, 8, 244),
            gap: 8,
            padding: EdgeInsets.all(10),
            onTabChange: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            tabs: [
              GButton(
                icon: Icons.home,
                 iconSize: 30,
                text: "Home",
              ),
              GButton(
                icon: Icons.history_edu_outlined,
                iconSize: 30,
                text: "History",
              ),
              GButton(
                icon: Icons.person,
                 iconSize: 30,
                text: "About",
              )
            ],
          ),
        ),
      ),
      body: listOfScreens[currentIndex],
    );
  }
}
