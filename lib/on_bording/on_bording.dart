import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_booking/constants/colors.dart';

class OnBording extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Lottie.asset(
                  'animations/onbording.json',
                ),
                SizedBox(height: 60),
                Text('Tell app ',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1F2937))),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Welcome to our image caption generation app!\n\nOur app is designed to help users quickly and easily generate captions for their images. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 83.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'onbordtwo');
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
