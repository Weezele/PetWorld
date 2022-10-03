// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:petworld/Data/constants.dart';
import 'package:petworld/Login/login_screen.dart';
import 'package:petworld/widgets/ordriver.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        // Here i can use size.width but use double.infinity because both work as a same
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      margin: EdgeInsets.only(right: 34),
                    ),
                    SvgPicture.asset(
                      "assets/icons/cat-svgrepo-com.svg",
                      height: size.height * 0.35,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: kPrimaryColor,
                            ),
                            hintText: "Your Email",
                            border: InputBorder.none),
                      ),
                    ),

                    // Password
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: TextField(
                        controller: _passwordController,
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
                    //Sign up button
                    Container(
                        width: size.width * 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            color: kPrimaryColor,
                            onPressed: () async {
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text);
                                Get.to(()=>LoginScreen());
                              } on FirebaseAuthException catch (error) {
                                Fluttertoast.showToast(
                                    msg: error.message,
                                    gravity: ToastGravity.CENTER,
                                    textColor: Colors.red);
                              }
                            },
                            child: Text(
                              "SIGNUP",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have an account ?",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to((LoginScreen()));
                            //Navigator.push(context,
                              //  MaterialPageRoute(builder: (context) {
                              //return LoginScreen();
                            //}));
                          },
                          child: Text(
                            "Log In!",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    OrDriver(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Facebook
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: kPrimaryLightColor),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              "assets/icons/facebook.svg",
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        //Google
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: kPrimaryLightColor),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              "assets/icons/google-plus.svg",
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        //Twitter
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: kPrimaryLightColor),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              "assets/icons/twitter.svg",
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
