import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_booking/constants/colors.dart';

import '../constants/cach_helper.dart';

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
    final token = await CacheHelber.getData(key: "access_token");
    

    if (token != null) {
      Navigator.of(context).pushReplacementNamed("mainScreen");
    }  else {
      Navigator.of(context).pushReplacementNamed("onbord");
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
