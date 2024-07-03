import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internapp/classes.dart';
import 'package:internapp/main.dart';
import 'package:internapp/login.dart';
import 'package:internapp/splash.dart';



class MyApplication extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyApplication({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<MyApplication> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Consider using a separate class for handling login logic
  Future<void> handleLogin() async {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == 'Admin' && password == 'passwd') {
      usernameController.clear();
      passwordController.clear();

      // Navigate to MyPage using the navigatorKey
      navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => MyPage(),
        ),
      );
    } else {
      usernameController.clear();
      passwordController.clear();

      Fluttertoast.showToast(
        msg: "Username or Password Incorrect",
        backgroundColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.red,
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(navigatorKey: navigatorKey,
      home:Scaffold(
        body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Divider(
                    thickness: 15,
                    color: Colors.blue,
                  ),
                  Text(
                    "HRMS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey[300],
                  ),
                  Text(
                    "Sign in to start your Session",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: Column(
                      children: [
                        InputBoxes(
                          detail: "Username",
                          design: Icons.person,
                          controller: usernameController,
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                        InputBoxes(
                          detail: "Password",
                          design: Icons.lock,
                          controller: passwordController,
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                        Check(checkname: "Remember Me"),
                        ElevatedButton(
                          onPressed: () {
                            handleLogin(); // Call the handleLogin method
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Background color of the button
                          ),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white, // Text color of the button
                              fontSize: 16,
                            ),
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
      ),
    );
  }
}

// Future<void> _register() async {
//   String username = usernameController.text;
//   String password = passwordController.text;
//
//   try {
//     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//       email: _emailController.text,
//       password: _passwordController.text,
//     );
//
//     setState(() {
//       _success = true;
//       _userEmail = userCredential.user!.email!;
//       _userPass =userCredential.user!.phoneNumber!;
//     });
//   } on FirebaseAuthException catch (e) {
//     setState(() {
//       _success = false;
//     });
//   }
// }
