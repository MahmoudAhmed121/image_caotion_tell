import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_booking/constants/colors.dart';

class OnBordingTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Lottie.asset(
                  'animations/onbording.json',
                ),
                  SizedBox(height: 60),
                Text('Take a picture or upload',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                         color: Mycolor.primaryColor)),
                SizedBox(
                  height: 22,
                ),
                Text(
                  'Simply upload an image, and our app will',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "generate a caption in seconds. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(
                  height: 12,
                ),
                // Text(
                //   "edit and refine the generated caption needs.",
                //   textAlign: TextAlign.center,
                //   style: TextStyle(fontSize: 16, color: Colors.grey),
                // ),
                SizedBox(height: 83.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'onbordthree');
                        },
                        icon: const Icon(
                          Icons.arrow_forward_sharp,
                          color: Mycolor.primaryColor,
                          size: 30,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
