import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_booking/colors.dart';

class Hestory extends StatelessWidget {
  Hestory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Lottie.asset("animations/history.json"),
              Text(
                "History",
                style: TextStyle(color: Mycolor.primaryColor, fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Divider(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "little girl in pink dress lying on the side of grass",
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "images/line.png",
                        color: Mycolor.primaryColor,
                        width: 150,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("two people are hiking up snowy mountain"),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "images/line.png",
                        color: Mycolor.primaryColor,
                        width: 150,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("two people are hiking up snowy mountain"),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "images/line.png",
                        color: Mycolor.primaryColor,
                        width: 150,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "little girl in pink dress lying on the side of grass",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
