import 'package:flutter/material.dart';
class Description extends StatefulWidget {
  final String image;
  final String bottleType;
  final String cost;
  const Description(
      {
        super.key, required this.image, required this.bottleType, required this.cost
      });

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
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
          child: Text("Water Bottles",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
              widget.image


          ),
          Text(widget.bottleType),
          Text(widget.cost),
        ],
      ),
    );
  }
}
