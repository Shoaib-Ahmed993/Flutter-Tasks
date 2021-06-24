import 'dart:html';

import 'package:flutter/material.dart' ;

class Screen extends StatefulWidget {

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  dynamic images = ["assets/note20 ultra.jpg","assets/macbook air.jpg","assets/macbook pro.jpg","assets/backlit keyboard.jpg","assets/gaming pc.jpg","assets/iphone12.jpg","assets/mercedes.jpg","assets/mutton.jpg","assets/royalfield.jpg","assets/roadster.jpg"];
  var imagesNames = ["Note 20 Ultra", "Macbook Air", "Macbook Pro", "Backlit Keyboard", "Gaming PC", "Iphone 12", "Mercedes", "Mutton", "Royal Field", "Roadster"];
  var items = ["Clothes", "Electric", "Households", "Appliances", "Others"];
  var itemsQuantity = ["5 items", "20 items", "9 items", "5 items", "15 items"];
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
            child: Column(
              children: [
                Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('More Categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ],
              ),
            ),


            Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: 
                 List.generate(items.length, (index) {
                  return Column(
                  // margin: EdgeInsets.all(20),
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // width: 150,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.store),
                        Text(items[index]),
                        Text(itemsQuantity[index],)
                        
                      ],
                    )
                  ]
                );

              },
            ),
            ),
          ),
            ],
            )
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

    bottomNavigationBar: BottomAppBar(
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.home,color: Colors.purple,),
            Icon(Icons.favorite,color: Colors.grey[600],),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: FloatingActionButton(
                onPressed: (){},
                child: Icon(Icons.search_sharp),
                backgroundColor: Colors.purple,
                
              ),
            ),
            Icon(Icons.add_shopping_cart,color: Colors.grey[600],),
            Icon(Icons.person,color: Colors.grey[600],),
          ],
        ),
      )
    )
    );
  }
}