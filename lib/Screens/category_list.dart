import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petworld/Screens/pet_detail.dart';
import 'package:petworld/models/data.dart';

class CategoryList extends StatelessWidget {
  final Category category;

  CategoryList({@required this.category});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference betsCollection =
        _firestore.collection(category == Category.HAMSTER
            ? "Hamsters"
            : category == Category.CAT
                ? "Cats"
                : category == Category.Bird
                    ? "Birds"
                    : category == Category.Fish
                        ? "Fish"
                        : category == Category.DOG
                            ? "Dogs"
                            : category == Category.BUNNY
                                ? "Bunnies"
                                : "Others");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //brightness: Brightness.light,
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          (category == Category.HAMSTER
                  ? "Hamsters"
                  : category == Category.CAT
                      ? "Cats"
                      : category == Category.Bird
                          ? "Birds"
                          : category == Category.Fish
                              ? "Fish"
                              : category == Category.DOG
                                  ? "Dogs"
                                  : category == Category.BUNNY
                                      ? "Bunnies"
                                      : "Others") +
              " Category",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [],
      ),
      body: StreamBuilder(
        stream: betsCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data.docs.map((document) {
              return GestureDetector(
                onTap: () {
                  Get.to(PetDetail(document));
                },
                child: Card(
                    child: Container(
                        width: 300,
                        height: 220,
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                  width: 300,
                                  child: Image.network(
                                    document["imgUrl"],
                                    height: 150,
                                    width: 300,
                                    fit: BoxFit.scaleDown,
                                  )),
                              Text("Name " + document["name"]),
                              Text("Condition " + document["condition"] ?? ""),
                              Text("Address " + document["location"]),
                            ],
                          ),
                        ))),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
