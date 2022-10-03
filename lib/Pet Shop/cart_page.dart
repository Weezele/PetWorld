import 'package:flutter/material.dart';

import '../widgets/cart_products.dart';
import '../widgets/cart_total.dart';


class CartPage extends StatefulWidget {
 // const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart '),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CartProducts(),
            CartTotal()

          ],
        ),
      ),
    );
  }
}
