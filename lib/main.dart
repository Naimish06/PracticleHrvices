import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicle_hrvices/Constant/colors.dart';
import 'package:practicle_hrvices/Constant/constan.dart';
import 'package:practicle_hrvices/View/HomeView.dart';
import 'package:practicle_hrvices/View/LoginView.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:const AppBarTheme(
            backgroundColor: AppbarColor
        ),
        primarySwatch: Colors.blue,
      ),
      home:const SplashView(),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String Login_user_id="";

  @override
  void initState(){
    super.initState();
    getUserData();
    Timer(Duration(seconds: 2), () {
      if(Login_user_id.isNotEmpty){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeView()));
      }else{
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginView()),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image:const AssetImage("asset/splash_logo.png"),
          width: MediaQuery
              .of(context)
              .size
              .width * 0.5,
          height: MediaQuery
              .of(context)
              .size
              .height * 0.5,
        ),
      ),
    );
  }

  Future<void> getUserData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login_user_id = prefs.getString(login_user_id)!;
    //print(Login_user_id);
  }
}
