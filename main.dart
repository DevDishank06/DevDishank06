import 'package:flutter/material.dart';
import 'package:myapp/sharedPreferences/Splashscreen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
       home: const SplashScreen(), // Directly starts with the splash screen
    );
  }
}


// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'login_page.dart';
// import 'home_page.dart';
// import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isLoggedIn = false; // Check if user is logged in or not
//   bool _isLoading = true; // Splash screen flag


//   @override
//   void initState() {
//     super.initState();
//     _checkLoginStatus();
//   }
//    // Check login status from shared preferences
//   Future<void> _checkLoginStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//     final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//      setState(() {
//         _isLoggedIn = isLoggedIn;
//       });
//     _startSplashScreenTimer();
//   }


//    void _startSplashScreenTimer() {
//     Timer(const Duration(seconds: 2), () {
//         setState(() {
//             _isLoading = false;
//          });
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//        home: _isLoading
//            ? _buildSplashScreen() // show the splash screen during loading
//            : (_isLoggedIn ? const HomePage() : const LoginPage()), // else show login or home based on login flag
//     );
//   }
//     Widget _buildSplashScreen() {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // Replace with your actual logo
//              Image.asset(
//               'assets/karma_logo.png', // Update with your logo image path
//               width: 200,
//               height: 200,
//             ),
//             const SizedBox(height: 20),
//             const CircularProgressIndicator(), // Optional loading indicator
//           ],
//         ),
//       ),
//     );
//   }
// }