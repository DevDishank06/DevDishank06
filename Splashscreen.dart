import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/sharedPreferences/Loginpage.dart';
import 'package:myapp/sharedPreferences/Homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalEmail = "";

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getValidationData().whenComplete(() async {
         final prefs = await SharedPreferences.getInstance();
        bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
        Timer(const Duration(seconds: 2), () => Get.offAll(isLoggedIn ?  const Homepage() : const LoginPage()));
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email') ?? "";
    setState(() {
      finalEmail = obtainedEmail;
    });
     print("Obtained email: $finalEmail");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              child: Icon(Icons.local_activity),
              radius: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: const CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}