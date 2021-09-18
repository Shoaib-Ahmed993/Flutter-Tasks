import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter/editDialog.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
    final Map data;
    Post({this.data});

  @override
  Widget build(BuildContext context) {
    void deletePost() async {
      try {
        FirebaseFirestore db = FirebaseFirestore.instance;
        await db.collection('posts').doc(data['id']).delete();
      } catch (e) {
        print(e.message);
      }      
    }

    void editPost(){
      showDialog(context: context, builder: (BuildContext context){
        return editDialog(data: data);
      });
    }
    
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.network(
            data["url"], 
            width: 120, 
            height: 120,
          ),
          Text(data["title"]),
          Text(data["description"]),
          ElevatedButton(onPressed: deletePost, child: Text("Delete")),
          ElevatedButton(onPressed: editPost, child: Text("Edit"))
        ],
      ),
      
    );
  }
}