import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({@required this.name,@required this.price,@required this.imageUrl});

  static Product fromSnapshot(DocumentSnapshot snap){
   Product product=Product(
       name: snap ['name'],
       price:snap ['price'],
       imageUrl:snap ['imageUrl']);
   return product;
  }

  static List <Product> products = [
    Product(
        name: 'Hamster bed',
        price: 20,
        imageUrl: 'https://m.media-amazon.com/images/I/71fvYqImcWL._AC_SL1500_.jpg'
    ),
    Product(
        name: 'Hamster ball',
        price: 20,
        imageUrl: 'https://i.pinimg.com/236x/4c/00/7b/4c007b92db5619bee58b050828e90074.jpg'
    ),
    Product(
        name: 'tank tree',
        price: 20,
        imageUrl: 'https://i.pinimg.com/236x/7d/12/43/7d1243f15fb7f9b750e57fccfd925e6c.jpg'
    ),
    Product(
        name: 'tank bridge ',
        price: 20,
        imageUrl: 'https://i.pinimg.com/564x/f1/0a/71/f10a71c520bbceb4aeb2678836d93c45.jpg'
    ),
    Product(
        name: 'birds toy',
        price: 20,
        imageUrl: 'https://i.pinimg.com/236x/dc/a9/eb/dca9eb401433b8a8673ac8851988c22d.jpg'
    ),
    Product(
        name: 'cat leash',
        price: 20,
        imageUrl: 'https://i.pinimg.com/236x/63/f4/68/63f468f7979ede12935475a9f292be00.jpg'
    ),
    Product(
        name: 'cat collar',
        price: 20,
        imageUrl: 'https://i.pinimg.com/236x/59/56/7a/59567a12e0db498022617ccaaf1696b8.jpg'
    ),
    Product(
        name: 'dog leash',
        price: 20,
        imageUrl: 'https://i.pinimg.com/236x/11/01/7a/11017a87a96a78bdd5a9813ee116def2.jpg'
    ),
    Product(
        name: 'dog collar',
        price: 20,
        imageUrl: 'https://i.pinimg.com/236x/b0/4e/43/b04e431aa7329b3c609ca2ec20fa89a2.jpg'
    ),
    Product(
        name: 'snake tank accessories ',
        price: 20,
        imageUrl: 'https://i.pinimg.com/236x/c0/40/ec/c040ecc48428caa8c2a6dc3c089eb8fb.jpg'
    ),
  ];

}
