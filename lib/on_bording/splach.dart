import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_booking/colors.dart';
import 'package:restaurant_booking/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splach extends StatefulWidget {
  const Splach({super.key});

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), Navigatorr);
   
  }

  void Navigatorr() async {
    final prefs = await SharedPreferences.getInstance();
    final access = await prefs.get("access_token");
    if (access == null) {
      Navigator.of(context).pushReplacementNamed("onbord");
    } else {
      Navigator.of(context).pushReplacementNamed("mainScreen");
    }
    if (Auth.instant.user == null) {
      print("mahmoud erorr ${Auth.instant.user}");
      Navigator.of(context).pushReplacementNamed("onbord");
    } else {
       print("mahmoud erorr ${Auth.instant.user}");
      Navigator.of(context).pushReplacementNamed("mainScreen");
    }
  }
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolor.primaryColor,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Image.asset(
          "images/tell.png",
          height: 250,
          width: 250,
        ),
      ),
    );
  }
}
