// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petworld/Settings/settings_page.dart';
import 'change_password.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 1,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ))),
        body: Container(
            padding: EdgeInsets.only(left: 16, top: 25, right: 16),
            child: ListView(
              children: [
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Account",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.only(right: 160),
                    child: TextButton(
                        onPressed: () {
                          Get.to(ChangePass());
                        },
                        child: Text(
                          "Change password",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ))),
                Container(
                    padding: EdgeInsets.only(right: 210),
                    child: TextButton(
                        onPressed: () {
                          Get.to(settingsPage());
                        },
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ))),
                SizedBox(
                  height: 110,
                ),
              ],
            )));
  }
}
