import 'package:flutter/material.dart';

class aboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("About Us"),
        ),
        body: Container(
          child: Text(
              'PetWorld is an application that was developed by pet lovers, we know how hard it is to maintain a life with a pet since we consider our pets as family members.Our app aims to help pet owners to have an easier life by searching for the right items their pets needs ♥',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),

          ),
        ),

    );
  }
}
