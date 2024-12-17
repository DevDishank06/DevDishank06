import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/sharedPreferences/Loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/sharedPreferences/Splashscreen.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Homepage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello $finalEmail',
              style: const TextStyle(fontSize: 26),
            ),
            MaterialButton(
              color: Colors.lightBlueAccent,
              child: const Text('Remove credentials'),
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                await sharedPreferences.remove('email');
                await sharedPreferences.setBool('isLoggedIn', false);
                Get.offAll(const LoginPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home')),
//       body: const Center(
//         child: Text('Welcome to the Home Page!'),
//       ),
//     );
//   }
// }