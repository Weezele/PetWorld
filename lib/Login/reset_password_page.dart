// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:get/get.dart';
import 'package:petworld/Data/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPassPage extends StatefulWidget {
 // const ResetPassPage({Key? key}) : super(key: key);

  @override
  _ResetPassPageState createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  final emailController = TextEditingController();
  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
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
                    "Reset Password",
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
                            Icons.person,
                            color: kPrimaryColor,
                          ),
                          hintText: "Your Email",
                          border: InputBorder.none),
                      onChanged: (value) {},
                    ),
                  ),

                  // Password

                  //Reset button
                  Container(
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: FlatButton(
                        padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        color: kPrimaryColor,
                        onPressed: () async {
                          FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
                          Navigator.pop(context);

                        },
                        child: Text(
                          "Reset Password",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                    ),

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



