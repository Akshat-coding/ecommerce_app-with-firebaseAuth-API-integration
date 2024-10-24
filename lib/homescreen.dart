import 'package:ecommerce_app/add_to_cart.dart';
import 'package:ecommerce_app/description.dart';
import 'package:ecommerce_app/list.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}
final TextEditingController searchBar = TextEditingController();

class _HomescreenState extends State<Homescreen> {
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
            child: Icon(Icons.shopping_basket_rounded,
              color: Colors.orange,
              size: 30,
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(

              child: TextField(

                controller: searchBar,
                decoration: InputDecoration(
                  hintText: "Search groceries or products",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.2),
                      filled: true,
                  fillColor: Colors.grey.withOpacity(0.2),
                    suffixIcon: Icon(Icons.mic),
                    suffixIconColor: Colors.grey
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Divider(height: 25, thickness: 5, color: Colors.grey.withOpacity(0.2),),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 20,),
              Text("Water Bottle Products",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,),
              ),
              SizedBox(width: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.graphic_eq,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
              SizedBox(width: 40,),
              Icon(Icons.grid_view_sharp,
                color: Colors.grey,
                size: 30,
              ),
            ],
          ),

          SizedBox(
            height: 695,
            child: ListView.builder(
              itemCount: bottleObjs.length,
              itemBuilder: (context, index){
                final obj = bottleObjs[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                      height: 350,
                    width: 300,

                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Colors.grey.withOpacity(0.2),
                            height: 340,
                            width: 250,
                            child: Column(
                              children: [
                                Stack(
                                  children: [

                                    Image.asset(obj.image,
                                      height: 250,
                                      width: 250,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Icon(Icons.favorite_border),
                                    ),
                            ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 20,),
                                    Text(obj.typeOfBottle,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                    ),
                                    SizedBox(width: 50,),
                                    Text(obj.cost,
                                      style: TextStyle(fontSize: 20, color: Colors.grey),
                                    ),

                                  ],

                                ),
                                SizedBox(height: 10,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Description(image: obj.image, bottleType: obj.typeOfBottle, cost: obj.cost)));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      color: Colors.orange,
                                      child: Row(
                                        children: [
                                          SizedBox(width: 5,),
                                          Icon(Icons.add,
                                          color: Colors.white,
                                          ),
                                          Text("Add To Cart",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              },

            ),
          )
        ],
      ),
    );
  }
}
