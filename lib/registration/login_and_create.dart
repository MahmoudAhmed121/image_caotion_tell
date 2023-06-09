
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get.dart';
import 'package:restaurant_booking/constants/colors.dart';
import 'package:restaurant_booking/cubit/login_cubit.dart';
import 'package:restaurant_booking/cubit/login_state.dart';
import 'package:restaurant_booking/main_screen/main_screen.dart';
import 'package:restaurant_booking/services/auth.dart';


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
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          
         Get.off(MainScreen(), duration: Duration(seconds: 2),transition: Transition.fade);
        } else if (state is LoginFailure) {
         Get.snackbar("Message","",backgroundColor: Colors.white,messageText: Text("${state.errorMessage}",
         style: TextStyle(color: Colors.black),
         ),
         isDismissible: true);
        }
        if (state is RegisSuccess) {
          print(state);
          Get.off(TabBarDemo(initialIndex: 1,),duration: Duration(seconds: 2),transition: Transition.cupertino);
        } else if (state is RegisFailure) {
    Get.snackbar("Message","",backgroundColor: Colors.white,messageText: Text("${state.errorMessage}",
         style: TextStyle(color: Colors.black),
         ),
         isDismissible: true
         );
        }
      },
      builder: (context, state) {
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
                  Tab(child: Text('Login'),),
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

                                  BlocProvider.of<LoginCubit>(context).signIn(nameController: nameController.text, emailController: emailController.text, passwordController: passwordController.text);
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
                                  onPressed: () {
                                 Auth.instant.signInWithGoogle();
                                  },
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
                                BlocProvider.of<LoginCubit>(context).Login(loginController: loginController.text, loginPasswordController: loginPasswordController.text);
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Color(0xff9CA3AF), fontSize: 20),
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
                                onPressed: () {
                                     Auth.instant.signInWithGoogle();
                                },
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
      },
    );
  }
}
