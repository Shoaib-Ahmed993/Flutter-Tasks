import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';
import 'package:path/path.dart' as path;
import 'post.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String imagePath;
  Stream postStream =
      FirebaseFirestore.instance.collection('posts').snapshots();
  @override
  Widget build(BuildContext context) {
    void pickImage() async {
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.getImage(source: ImageSource.gallery);
      // print(image.path);
      // String basename = path.basename(image.path);
      // print(basename);
      setState(() {
        imagePath = image.path;
      });
    }

    void submitPost() async {
      try {
        String title = titleController.text;
        String description = descriptionController.text;
        String imageName = path.basename(imagePath);
        // firebase_storage.FirebaseStorage storage =
        //     firebase_storage.FirebaseStorage.instance;
        firebase_storage.Reference ref =
            firebase_storage.FirebaseStorage.instance.ref('/$imageName');
        File file = File(imagePath);
        await ref.putFile(file);
        String downloadedURL = await ref.getDownloadURL();
        FirebaseFirestore db = FirebaseFirestore.instance;
        await db.collection("posts").add({
          "title": title,
          "description": description,
          "url": downloadedURL
        });

        print("Post uploaded successfully");
        titleController.clear();
        descriptionController.clear();
      } catch (e) {
        print(e.message);
      }
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
            child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Enter title'),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Enter description'),
            ),
            ElevatedButton(onPressed: pickImage, child: Text("Pick Image")),
            ElevatedButton(onPressed: submitPost, child: Text("submit post")),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: StreamBuilder<QuerySnapshot>(
                  stream: postStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    return ListView(
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        Map data = document.data();
                        String id = document.id;
                        data["id"] = id;
                        return Post(
                          data: data,
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
