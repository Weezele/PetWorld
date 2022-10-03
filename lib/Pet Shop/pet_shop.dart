import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/catalog_product.dart';
import 'cart_page.dart';
//import 'package:get/get_core/src/get_main.dart';


class PetShop extends StatefulWidget {
  @override
  _PetShopState createState() => _PetShopState();
}

class _PetShopState extends State<PetShop> with TickerProviderStateMixin {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.transparent,

        title: Text('Pet Shop'),

      ),
      body:
       Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CatalogProducts(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: ElevatedButton(
                  onPressed: ()=>Get.to(()=>CartPage()),
                  child: Text('Go to Cart')),
            ),
          ],
        ),

    );
  }
}

