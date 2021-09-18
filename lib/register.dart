import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void register() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;

      final String username = usernameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;

      try {
        final UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
        await db.collection("users").doc(user.user.uid).set({
          "email": email,
          "username": username,
          // "password": password
        });

        print("User is Registered");
        
      } catch (e) {
        print("Error");
      }
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: Column(
            children: [
              TextFormField(
                controller: usernameController,
                decoration:
                    const InputDecoration(labelText: 'Enter your username'),
              ),
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
              ElevatedButton(onPressed: register, child: Text("Register"))
            ],
          ),
        ),
      ),
    );
  }
}
