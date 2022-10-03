// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:petworld/Data/constants.dart';
import 'package:petworld/Login/reset_password_page.dart';
import 'package:petworld/Screens/principal.dart';
import 'package:petworld/Signup/Signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    //User user = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/login_logout/main_top.png",
                width: size.width * 0.35,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login_logout/login_bottom.png",
                width: size.width * 0.4,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LOGIN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/icons/dog-breed-svgrepo-com.svg",
                    height: size.height * 0.35,
                  ),

                  // Email
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: kPrimaryColor,
                          ),
                          hintText: "Your Email",
                          border: InputBorder.none),
                     // onChanged: (value) {},
                    ),
                  ),

                  // Password
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      onChanged: (value) {},
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: kPrimaryColor,
                          ),
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: kPrimaryColor,
                          ),
                          hintText: "Password",
                          border: InputBorder.none),
                    ),
                  ),

                  //Login button
                  Container(
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        color: kPrimaryColor,
                        onPressed: () async {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);
                           Get.to(()=>Principal());
                          } on FirebaseAuthException catch (error) {
                            Fluttertoast.showToast(
                                msg: error.message,
                                gravity: ToastGravity.CENTER,
                                textColor: Colors.red);
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                    ),

                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [TextButton(onPressed: (){
                      Get.to(()=>ResetPassPage());
                    }, child: Text('Forget Password'))],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an Account ?",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(()=>SignUpScreen());
                        },
                        child: Text(
                          "Sign UP!",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
