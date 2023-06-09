import 'package:flutter/material.dart';
import 'package:restaurant_booking/constants/cach_helper.dart';
import 'package:restaurant_booking/constants/colors.dart';

class OnBordingThree extends StatelessWidget {
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
                Image.asset(
                  'images/tell pink.png',
                  height: 250,
                  width: 250,
                ),
                SizedBox(height: 15),
                Text('Tell the story behind every images',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Mycolor.primaryColor)),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Thank you for choosing our image caption generation app, we hope you find it useful and enjoy using it.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                SizedBox(height: 177),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () async {
                          await CacheHelber.saveData(
                                  key: "onbording", value: true)
                              .then((value) {
                            Navigator.of(context).pushReplacementNamed("regis");
                          });
                        },
                        icon: Icon(
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
