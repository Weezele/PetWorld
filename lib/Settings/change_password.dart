import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Screens/welcome_screen.dart';

class ChangePass extends StatefulWidget {
  //const ChangePass({Key? key}) : super(key: key);

  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final _fromKey = GlobalKey();
  var newPassword = " ";
  final newPasswordController = TextEditingController();
  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;

  changePassword() async {
    try {
      await currentUser.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Get.to(WelcomeScreen());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black26,
          content: Text(' Your Password has been Changed.. Login again '),
        ),
      );
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _fromKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
          child: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  "assets/icons/dog-breed-svgrepo-com.svg",
                  height: size.height * 0.35,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    hintText: 'Enter new Password',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.black26, fontSize: 15.0),
                  ),
                  controller: newPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Password ';
                    }
                    return null;
                  },
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: ElevatedButton(
                    child: Text(
                      'Change Password',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    onPressed: () {
                      setState(() {
                        newPassword = newPasswordController.text;
                      });
                      changePassword();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  bool validate() {}
}

class FromState {}
