import 'package:get/get.dart';

import '../models/data.dart';
import 'package:flutter/material.dart';
import '../Screens/category_list.dart';

Widget buildPetCategory(Category category, String total, Color orange,context) {
  return Expanded(
    child: GestureDetector(
      onTap: (){
        Get.to(CategoryList(category: category ,));
      },
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              child: Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    "assets/images/" +
                        (category == Category.HAMSTER
                            ? "hamster"
                            : category == Category.CAT
                            ? "cat"
                            : category == Category.BUNNY
                            ? "bunny"
                            : category == Category.Bird
                            ? "bird"
                            : category == Category.Fish
                            ? "fish"
                            : category == Category.Snake
                            ? "snake"
                            : "dog") +
                        ".png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  category == Category.HAMSTER
                      ? "Hamsters"
                      : category == Category.CAT
                      ? "Cats"
                      : category == Category.BUNNY
                      ? "Bunnies"
                      : category == Category.Bird
                      ? "Birds"
                      : category == Category.Fish
                      ? "Fish"
                      : category == Category.Snake
                      ? "Others"
                      : "Dogs",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Total of: " + total,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}