import 'package:flutter/material.dart';
import 'package:restaurant_booking/colors.dart';
import 'package:restaurant_booking/registration/login_and_create.dart';

class FirstRegister extends StatelessWidget {
  const FirstRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 65),
                Image.asset(
                  'images/tell pink.png',
                  width: 270,
                  height: 270,
                ),
                SizedBox(height: 40),
                const Text(
                  'Welcome',
                  style: TextStyle(
                      color: Color(0xff1F2937),
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
                SizedBox(height: 18),
                const Text(
                  "Before enjoying Tell services \n       \n         Please register first",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(
                        0xff4B5563,
                      )),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        margin: EdgeInsets.only(left: 40, right: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Mycolor.primaryColor,
                        ),
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {
                            showModalBottomSheet<dynamic>(
                                isScrollControlled: true,
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                                builder: (BuildContext bc) {
                                  return ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20.0),
                                    ),
                                    child: Container(
                                      height: 600.0,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20.0),
                                          )),
                                      child: TabBarDemo(initialIndex: 0),
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 55,
                        margin: EdgeInsets.only(left: 40, right: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: Color.fromARGB(0, 255, 255, 255),
                        ),
                        width: double.infinity,
                        child: MaterialButton(
                            onPressed: () {
                              showModalBottomSheet<dynamic>(
                                isScrollControlled: true,
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                                builder: (BuildContext bc) {
                                  return SingleChildScrollView(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.0),
                                      ),
                                      child: Container(
                                        height: 600.0,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20.0),
                                            )),
                                        child: TabBarDemo(initialIndex: 1),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Mycolor.primaryColor, fontSize: 20),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
