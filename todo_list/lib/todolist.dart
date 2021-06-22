import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  
  var output = "";
  List<dynamic> list = ["Sir Ali", "Sir Bilal", "Sir Umair"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8cc0e6),
      appBar: AppBar(
        title: Center(child: Text('Todo List', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),)
      ),
      backgroundColor: Colors.lightBlue,
      ),

      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
        return Container(
          height: 70,
          color: Colors.white54,
          margin: EdgeInsets.all(10),
          child: Center(
            child: ListTile(
              title: Text("${list[index]}", style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w700, fontSize: 16, fontStyle: FontStyle.italic),),
              trailing: Container(
                width: 50,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: Text('Edit Item',style: TextStyle(color: Colors.lightBlue, fontStyle: FontStyle.italic),),
                            content: TextField(
                            onChanged: (value){
                              output = value;
                            },
                          ),
                          actions: [
                            ElevatedButton(onPressed: (){
                              Navigator.of(context).pop();
                              setState(() {
                                list.replaceRange(index, index+1, {output});
                              });
                            }, child: Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                            )
                          ],
                          );
                        });
                      },
                      child: Icon(
                        Icons.edit_outlined,
                        color: Colors.lightGreen,
                        size: 25,
                      ),
                    ),


                    GestureDetector(
                      onTap: (){
                        setState(() {
                          list.removeAt(index);      
                        });
                      },
                      child: Icon(
                        Icons.close_outlined,
                        color: Colors.red,
                        size: 25,
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text('Add Item',style: TextStyle(color: Colors.lightBlue, fontStyle: FontStyle.italic),),
            content: TextField(
              onChanged: (value){
                output = value;
              },
            ),
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
                setState(() {
                  list.add(output);     
                });
              }, child: Icon(Icons.add)
            )
            ],
          );
        });
      }, child: Icon(
        Icons.add,
        size: 30,
      ),
    ),
    );
  }
}