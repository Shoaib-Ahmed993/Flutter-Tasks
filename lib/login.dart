import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController(text: "shoaib@gmail.com");
    final TextEditingController passwordController = TextEditingController(text: "123456");

    void login() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;

      final String email = emailController.text;
      final String password = passwordController.text;

      try {
       final UserCredential user = await auth.signInWithEmailAndPassword(email: email, password: password);
       final DocumentSnapshot snapshot = await db.collection("users").doc(user.user.uid).get();
       final data = snapshot.data();
      //  print("user is logged in");
      //  print(data["username"]);
      //  print(data["email"]);
      Navigator.of(context).pushNamed("/home", arguments: data);
        
      } catch (e) {
        print("Error");

        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(content: Text(e.message),);
        });
        print(e.message);
      }
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: Column(
            children: [
              
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration:
                    const InputDecoration(labelText: 'Enter your email'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                decoration:
                    const InputDecoration(labelText: 'Enter your password'),
              ),
              SizedBox(height: 10),
              ElevatedButton(onPressed: login, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
