import 'package:flutter/material.dart' ;

class Screen extends StatefulWidget {

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  dynamic images = ["assets/note20 ultra.jpg","assets/macbook air.jpg","assets/macbook pro.jpg","assets/backlit keyboard.jpg","assets/gaming pc.jpg","assets/iphone12.jpg","assets/mercedes.jpg","assets/mutton.jpg","assets/royalfield.jpg","assets/roadster.jpg"];
  var imagesNames = ["Note 20 Ultra", "Macbook Air", "Macbook Pro", "Backlit Keyboard", "Gaming PC", "Iphone 12", "Mercedes", "Mutton", "Royal Field", "Roadster"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
              "Ecom App UI",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
    ),

    body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Items', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                Text('View More', style: TextStyle(color: Colors.purple),)
              ],
            ),
          ),

          Container(
            height: 220,
            child: ListView(
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: 
                 List.generate(images.length, (index) {
                  return Container(
                  margin: EdgeInsets.all(20),
                  height: 210,
                  width: 330,
                  child: Image.asset(images[index]),
                );
              },

            )
              
            ),
            
          ),


          

          Container(
            width: 400,
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: List.generate(images.length, (index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  child: Image.asset(images[index]),
                );
              }),
            ),
          ),
          

        ],
      ),
    ),
    );
  }
}