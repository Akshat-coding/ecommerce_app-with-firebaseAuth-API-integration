import 'package:flutter/material.dart';
class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          child: Icon(Icons.keyboard_backspace_rounded,
            size: 30,

          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0, top: 20),
            child: Icon(Icons.shopping_basket_outlined,
              color: Colors.orange,
              size: 30,
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 20),
          child: Text("Fruits & Vegetables",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      //body: ,
    );
  }
}
