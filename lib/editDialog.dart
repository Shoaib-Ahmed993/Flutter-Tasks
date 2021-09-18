import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';
import 'package:path/path.dart' as path;

class editDialog extends StatefulWidget {
  final Map data;
  editDialog({this.data});

  @override
  _editDialogState createState() => _editDialogState();
}

class _editDialogState extends State<editDialog> {
  String imagePath;
  TextEditingController titleController =
      TextEditingController();
  TextEditingController descriptionController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.data['title'];
    descriptionController.text = widget.data['description'];
  }

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

    void done() async {
      try {
        String imageName = path.basename(imagePath);
        firebase_storage.Reference ref =
            firebase_storage.FirebaseStorage.instance.ref('/$imageName');
        File file = File(imagePath);
        await ref.putFile(file);
        String downloadedURL = await ref.getDownloadURL();
        FirebaseFirestore db = FirebaseFirestore.instance;
        Map<String, dynamic> newPost = {
          "title": titleController.text,
          "description": descriptionController.text,
          "url": downloadedURL
        };

        await db.collection("posts").doc(widget.data['id']).set(newPost);
        Navigator.of(context).pop();
      } catch (e) {
        print(e.message);
      }
    }

    return AlertDialog(
      content: Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,
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
          ElevatedButton(onPressed: done, child: Text("Done")),
        ],
      )),
    );
  }
}
