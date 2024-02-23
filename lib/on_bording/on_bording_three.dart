import 'package:flutter/material.dart';
import 'package:restaurant_booking/constants/colors.dart';

class OnBordingThree extends StatelessWidget {
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
                Image.asset(
                  'images/tell pink.png',
                  height: 250,
                  width: 250,
                ),
                SizedBox(height: 60),
                Text('Tell The Story Behind Every Image',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Mycolor.primaryColor)),
                SizedBox(
                  height: 22,
                ),
                Text(
                  'Thank you for choosing our image caption',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "generation app, we hope you find it useful",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "and enjoy using it.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey
                  ),
                ),
                 SizedBox(height: 83.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'regis');
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
