import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homescreen.dart';
import 'login.dart';
import 'dart:developer';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}
final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();
final TextEditingController _name = TextEditingController();
final TextEditingController _phoneNumber = TextEditingController();
void createAccount(BuildContext context) async{
  final email = _email.text.trim();
  final password = _password.text.trim();
  if (email.isEmpty||password.isEmpty){
    log("Please insert your credentials");
    showWarning(context, "Please insert you credentials");
  }
  else{
    try{
      UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(password: password, email:email);
      if (user.user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
      }
    }
    on FirebaseAuthException catch(e){
      log("Message: ${e.code.toString()}");
      showWarning(context, "Message: ${e.code.toString()}");
      log("error");
    }
  }
}
showWarning (BuildContext context, String text){
  return showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text(text),
    );
  });
}
class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1200,
        width: double.infinity,
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 80,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text("Create Account",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 75.0, top: 8, bottom: 30),
                child: Text("Sign up to begin your journey today",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 275.0, bottom: 5),
                child: Text("Full Name",
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
                  controller: _name,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 17),
                    hintText: "Enter your full name",
                    floatingLabelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 240.0, bottom: 5, top: 25),
                child: Text("Email Address",
                  style: TextStyle(fontSize: 18,color: Colors.white),
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
                    contentPadding: EdgeInsets.only(left: 15),
                    hintText: "Enter your email",
                    hintStyle: TextStyle(color: Colors.grey),

                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 240.0, bottom: 5, top: 25),
                child: Text("Mobile Number",
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
                  controller: _phoneNumber,
                  decoration: InputDecoration(

                    hintText: "Enter Your Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(left: 15),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 285.0, bottom: 5, top: 25),
                child: Text("Password",
                  style: TextStyle(fontSize: 18, color: Colors.white),
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

                    hintText: "Enter Your Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: Icon(Icons.visibility_off_outlined,
                      color: Colors.grey,
                    ),
                    contentPadding: EdgeInsets.only(left: 15, top: 10),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(width: 20),
              Text("By signing up you agree to the ",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),

              Row(
                children: [
                  SizedBox(width: 50,),
                  Text("terms and conditions",
                    style: TextStyle(color: Colors.redAccent, fontSize: 18),
                  ),
                  Text(" and ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text("privacy policy",
                    style: TextStyle(color: Colors.redAccent, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              GestureDetector(

                  onTap: (){
                    createAccount(context);
                  },

                child: Container(
                  height: 50,
                  width: 375,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("Create Account",
                      style: TextStyle(color: Colors.white,  fontSize: 20),
                    ),
                  ),
                ),
              ),
              //   SizedBox(height: 35,),
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
                    child: Text("Or sign up with",
                      style: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold),
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
              SizedBox(height: 15,),
              Image.asset("assets/blah.jpg"),
              //SizedBox(height: 125,),
              SizedBox(height: 7,),
              Row(
                children: [
                  SizedBox(width: 75,),
                  Text("Already have an account?",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(" Login",
                      style: TextStyle(color: Colors.redAccent, fontSize: 18, fontWeight: FontWeight.bold),
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
