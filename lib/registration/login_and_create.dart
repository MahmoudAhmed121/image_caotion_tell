import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_booking/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabBarDemo extends StatefulWidget {
  TabBarDemo({super.key, required this.initialIndex});

  final initialIndex;

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<FormState> _keyTwo = GlobalKey();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController loginController = TextEditingController();

  TextEditingController loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.initialIndex,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Container(
            height: 8.0,
            width: 60.0,
            decoration: BoxDecoration(
              color: Color(0xffD2D4D8),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          elevation: 0.0,
          toolbarHeight: 50,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Mycolor.primaryColor,
            labelColor: Mycolor.primaryColor,
            unselectedLabelColor: Color(0xff89909E),
            tabs: [
              Tab(child: Text('Create Account')),
              Tab(child: Text('Login')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: const [
                            Text(
                              'Full Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 14, right: 14),
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value!.length <= 5) {
                              return 'Please Enter Your Name Again';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Full Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: const [
                            Text(
                              'Email Address',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 14, right: 14),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value1) {
                            if (value1!.isEmpty) {
                              return 'Please Enter Email Again';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'https://tell.netlify.app',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: const [
                            Text(
                              'Password',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 14, right: 14),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          validator: (value2) {
                            if (value2!.length <= 5) {
                              return ' Oops! Your Password Is Not Correct ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: '**** **** ****',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 55,
                        margin: const EdgeInsets.only(left: 50, right: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffF4F4F4),
                        ),
                        width: 220,
                        child: MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signIn();
                            }
                          },
                          child: const Text(
                            'Registration',
                            style: TextStyle(
                                color: Color(0xff9CA3AF), fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 120, right: 120),
                        child: Divider(height: 25),
                      ),
                      Container(
                        height: 55,
                        margin: EdgeInsets.only(left: 50, right: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffF4F4F4),
                        ),
                        width: 220,
                        //
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('images/ic_google.png'),
                            MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                'Sign up with Google',
                                style: TextStyle(
                                    color: Color(0xff222222), fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //
            Form(
              key: _keyTwo,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Row(
                        children: const [
                          Text(
                            'Email Address',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 14, right: 14),
                      child: TextFormField(
                        controller: loginController,
                        validator: (value) {
                          if (value!.isEmpty || value.length <= 5) {
                            return "Your Email is not Correct";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'https://tell.netlify.app',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Row(
                        children: const [
                          Text(
                            'Password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 14, right: 14),
                      child: TextFormField(
                        obscureText: true,
                        controller: loginPasswordController,
                        validator: (value) {
                          if (value!.length < 5) {
                            return "Password is wrong";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: '*** *** ***',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      height: 55,
                      margin: const EdgeInsets.only(left: 50, right: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffF4F4F4),
                      ),
                      width: 220,
                      child: MaterialButton(
                        onPressed: () {
                          if (_keyTwo.currentState!.validate()) {
                            Login();
                          }
                        },
                        child: Text(
                          'Login',
                          style:
                              TextStyle(color: Color(0xff9CA3AF), fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 90, right: 90),
                      child: const Divider(height: 25),
                    ),
                    Container(
                      height: 55,
                      margin: const EdgeInsets.only(left: 50, right: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffF4F4F4),
                      ),
                      width: 220,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/ic_google.png'),
                          MaterialButton(
                            onPressed: () {},
                            child: const Text(
                              'Login with Google',
                              style: TextStyle(
                                  color: Color(0xff222222), fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void Login() async {
    try {
      final response =
          await Dio().post("https://api.escuelajs.co/api/v1/auth/login", data: {
        "email": loginController.text,
        "password": loginPasswordController.text,
      });

      final accessToken = response.data["access_token"];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("access_token", accessToken);
      final access = await prefs.get(accessToken);
      print("my access Token is : $access");
      Navigator.of(context).pushReplacementNamed("mainScreen");
    } on DioError catch (e) {
      print(e.response!.statusCode);
      if (e.response!.statusCode == 401) {
        print("my response is: ${e.response}");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("No Data"),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  void signIn() async {
    try {
      final Response =
          await Dio().post("https://api.escuelajs.co/api/v1/users/", data: {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "avatar": "https://api.lorem.space/image/face?w=640&h=480"
      });

      Navigator.pushReplacementNamed(context, "tabBar");
    } on DioError catch (x) {
      if (x.response!.statusCode == 400) {
        print("gamedddddddd $x");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("The email is wrong"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
