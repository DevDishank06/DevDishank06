import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/sharedPreferences/Homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: 'Enter Email',
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: 'Enter Password',
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
                sharedPreferences.setString('email', emailController.text);
                await sharedPreferences.setBool('isLoggedIn', true);
                 Get.to(const Homepage());
              },
              color: Colors.redAccent,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'home_page.dart'; // Import your home page
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLoading = false; // To manage the loading indicator

//   Future<void> _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//          setState(() {
//           _isLoading = true; // Show loader when button is pressed
//         });
//        // Simulate a login process (replace with actual authentication logic)
//       await Future.delayed(const Duration(seconds: 2)); //Simulate API request

//        setState(() {
//         _isLoading = false;
//        });
//       // Set the login flag in shared preferences
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setBool('isLoggedIn', true);

//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (context) => const HomePage(),
//           ),
//         );
//     }
//   }

//     @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: _isLoading 
//            ?  const Center(
//                     child: CircularProgressIndicator(), 
//               )
//           :  Padding(
//                 padding: const EdgeInsets.all(16.0),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                            TextFormField(
//                              controller: _emailController,
//                              keyboardType: TextInputType.emailAddress,
//                             decoration: const InputDecoration(
//                               labelText: 'Email',
//                                border: OutlineInputBorder(),
//                               ),
//                                validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                    return 'Please enter your email';
//                                 }
//                               if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                     .hasMatch(value)) {
//                                 return 'Please enter a valid email';
//                               }
//                               return null;
//                               },
//                            ),
//                             const SizedBox(height: 16),
//                              TextFormField(
//                              controller: _passwordController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Password',
//                                  border: OutlineInputBorder(),
//                                ),
//                                 obscureText: true,
//                                validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                    return 'Please enter your password';
//                                  }
//                                 return null;
//                                 },
//                            ),
//                             const SizedBox(height: 24),
//                               ElevatedButton(
//                                   onPressed: _submitForm,
//                                    child: const Text('Login'),
//                              ),
//                            ],
//                        ),
//                    ),
//                 )
//       );
//   }
// }