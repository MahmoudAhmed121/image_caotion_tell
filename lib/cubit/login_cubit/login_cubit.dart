
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_booking/cubit/login_cubit/login_state.dart';



import 'package:shared_preferences/shared_preferences.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void Login(
      {required String loginController,
      required String loginPasswordController}) async {
   ;
    try {
      final response =
          await Dio().post("https://api.escuelajs.co/api/v1/auth/login", data: {
        "email": loginController,
        "password": loginPasswordController,
      });

      final accessToken = response.data["access_token"];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("access_token", accessToken);
      
   
      emit(LoginSuccess());

    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        emit(LoginFailure(errorMessage: " please make sure you have entered the right credentials"));
       
      }
    }
  }

  void signIn(
      {required String nameController,
      required String emailController,
      required String passwordController}) async {
    
    try {
      final response =
          await Dio().post("https://api.escuelajs.co/api/v1/users/", data: {
        "name": nameController,
        "email": emailController,
        "password": passwordController,
        "avatar": "https://api.lorem.space/image/face?w=640&h=480"
      });

      emit(RegisSuccess());
    } on DioError catch (x) {
     
      if (x.response!.statusCode == 400) {
        emit(RegisFailure(
            errorMessage: "You should enter Valid email"));
            
      }
    }
  }



}