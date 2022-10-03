// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petworld/Settings/about_us.dart';

import '../Screens/add_post.dart';
import '../Screens/welcome_screen.dart';
import '../Settings/Settings.dart';

class DrawerChild extends StatefulWidget {
  @override
  _DrawerChildState createState() => _DrawerChildState();
}

class _DrawerChildState extends State<DrawerChild> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        new UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/face.jpg'),
            ),
            accountName: Text(
              'PetWorld',
              style: TextStyle(fontSize: 20),
            ),
            accountEmail: Text("admin@admin.com")),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            Get.to(SettingsPage());
          },
        ),
        ListTile(
          leading: Icon(Icons.account_box_outlined),
            title: Text('About us '),
            onTap: () {
              Get.to(aboutUsPage());
            }),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Icon(Icons.add_to_photos),
            title: Text('Add post'),
            onTap: () {
              Get.to(addPost());
            }),
        SizedBox(
          height: 300,
        ),
        ListTile(
            leading: Icon(Icons.logout),
          title: Text('Log out',
          style: TextStyle(
            color: Colors.red,
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
          ),
          
          onTap:()async{
            FirebaseAuth.instance.signOut();
                    Get.to(WelcomeScreen());
          },
        )
      ],
    );
  }
}
