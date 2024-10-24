import 'dart:developer';

import 'package:ecommerce_app/homescreen.dart';
import 'package:ecommerce_app/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();
void _login(BuildContext context) async{
  final email = _email.text.trim();
  final password = _password.text.trim();
  if (email.isEmpty||password.isEmpty){
    log("Please insert your credentials");
    showWarning(context, "Please insert your credentials");
  }
  else{
    try{
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(password: password, email:email);
      if (user.user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
      }
    }
    on FirebaseAuthException catch(e){
      log("Message: ${e.code.toString()}");
      showWarning(context, e.code.toString());
      log("error");
    }
  }
}
showWarning(BuildContext context, String text) {
  return showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: Text(text),
    );
  },);
}
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios_sharp,
        size: 30,
      ),
        backgroundColor: Colors.grey.withOpacity(0.1),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey.withOpacity(0.1),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text("Log in",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.star,
                      size: 30,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 35.0, top: 10, bottom: 30),
                child: Text("Welcome back! Please enter your details.",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 330.0, bottom: 5),
                child: Text("Email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 375,
                // color: Colors.red,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined,
                      color: Colors.grey,
                    ),
                    hintText: "Enter Your Email",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 300.0, bottom: 5, top: 25),
                child: Text("Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 375,
                // color: Colors.red,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline,
                      color: Colors.grey,
                    ),
                    hintText: "Enter Your Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: Icon(Icons.visibility_off_outlined,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15),
                child: Row(
                  children: [
                    Icon(Icons.check_box,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5,),
                    Text("Remember me for 30 days",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(width: 50,),
                    Text("Forgot password",
                      style: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  _login(context);
                },
                child: Container(
                  height: 50,
                  width: 375,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("Log in",
                      style: TextStyle(color: Colors.white,  fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 10),
                    child: Container(
                      height: 1,
                      width: 125,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text("Or log in with",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Container(
                      height: 1,
                      width: 130,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 45,),
                  Image.asset("assets/apple.jpg"),
                  Image.asset("assets/google.jpg"),
                  Image.asset("assets/facebook.jpg"),
                  SizedBox(width: 50,),
                ],
              ),

              SizedBox(height: 200,),
              Row(
                children: [
                  SizedBox(width: 100,),
                  Text("Don't have an account?",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Text("Sign up",
                      style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),
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
}

