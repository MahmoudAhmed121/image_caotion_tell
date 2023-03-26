import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:restaurant_booking/colors.dart';
import 'package:restaurant_booking/cubit/login_cubit/login_cubit.dart';
import 'package:restaurant_booking/main_screen/account_screen.dart';
import 'package:restaurant_booking/main_screen/hestory.dart';
import 'package:restaurant_booking/main_screen/home_screen.dart';
import 'package:restaurant_booking/main_screen/main_screen.dart';
import 'package:restaurant_booking/on_bording/on_bording.dart';
import 'package:restaurant_booking/on_bording/on_bording_three.dart';
import 'package:restaurant_booking/on_bording/on_bording_two.dart';
import 'package:restaurant_booking/on_bording/splach.dart';
import 'package:restaurant_booking/registration/first_registration.dart';
import 'package:restaurant_booking/registration/login_and_create.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Mycolor.primaryColor,
    systemNavigationBarColor: Colors.black,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(),),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'splach',
        routes: {
          'splach': (context) => Splach(),
          'onbord': (context) => OnBording(),
          'onbordtwo': (context) => OnBordingTwo(),
          'onbordthree': (context) => OnBordingThree(),
          'regis': (context) => FirstRegister(),
          'page': (context) => HomeScreen(),
          'mainScreen': (context) => MainScreen(),
          'team': (context) => TeamScreen(),
          "tabBar": (context) => TabBarDemo(initialIndex: 1),
          "hestory": (context) => Hestory(),
        },
      ),
    );
  }
}
