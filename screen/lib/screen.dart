
import 'package:flutter/material.dart' ;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class Screen extends StatefulWidget {

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  dynamic images = ["assets/note20 ultra.jpg","assets/macbook air.jpg","assets/macbook pro.jpg","assets/backlit keyboard.jpg","assets/gaming pc.jpg","assets/iphone12.jpg","assets/mercedes.jpg","assets/mutton.jpg","assets/royalfield.jpg","assets/roadster.jpg",'assets/wireless.jpg', 'assets/tablet.jpg', 'assets/samsung.jpg'];
  var imagesNames = ["Note 20 Ultra", "Macbook Air", "Macbook Pro", "Backlit Keyboard", "Gaming PC", "Iphone 12", "Mercedes", "Mutton", "Royal Field", "Roadster", "Wireless", "Tab", "Samsung"];
  var items = ["Clothes", "Electronic", "Households", "Appliances", "Others",];
  var itemsQuantity = ["5 items", "20 items", "9 items", "5 items", "15 items"];
  var itemIcons = [Icons.store, Icons.flash_auto, Icons.house, Icons.microwave, Icons.double_arrow];

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      // ****************** AppBar *******************
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



    // ****************** Body ****************
    body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Items', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),),
                Text('View More', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w500),)
              ],
            ),
          ),



          // ************ Horizontal Items List *************
          Container(
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: 
                List.generate(images.length, (index) {
                  return Container(
                  margin: EdgeInsets.all(25),
                  width: 320,
                  child: Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Expanded(
                        child: Image.asset(images[index], fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),
                      ),
                      SizedBox(height: 5,),
                      Text('  ${imagesNames[index]} ',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: RatingBarIndicator(
                              rating: 6,
                              itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                              ),
                              itemCount: 6,
                              itemSize: 10,
                              direction: Axis.horizontal,
                            ),
                          ),
                          Text(' 5.0 (23 Reviews)',style: TextStyle(fontSize: 10, color: Colors.black),),
                        ],
                      ),
                      SizedBox(height: 5,)
                    ],
                  ),
                  ),
                  );
                },
                )
            ),
          ),


          // ************ More *************
          Container(
            child: Column(
              children: [
                Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('More Categories\n', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),),
                ],
              ),
            ),

            // ************* horizontal cards **************
            Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: 
                 List.generate(items.length, (index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 160,
                            color: Colors.white,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(itemIcons[index], color: Colors.purple,),
                                SizedBox(width: 10),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(text: items[index]+" \n", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                                      TextSpan(text: itemsQuantity[index], style: TextStyle(color: Colors.black)),
                                    ]
                                  )
                                ),
                              ],
                            ),
                          )
                          
                        ],
                      )
                    ],
                    
                ),
                  );

              },
            ),
            ),
          ),




          // ********** Popular *************
          Padding(
            padding:  EdgeInsets.only(left: 10, right: 10,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Items', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),),
                Text('View More', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w500),)
              ],
            ),
          ),
            ],
            )
          ),

         

          
          // **************** Vertical Items List ***************8
          Container(
            width: 380,
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(images.length, (index) {
                return Container(
                  width: 120,
                  margin: EdgeInsets.all(10),
                  height: 100,
                  child: Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Expanded(
                        child: Image.asset(images[index], fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),
                      ),
                      SizedBox(height: 5,),
                      Text('  ${imagesNames[index]}',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RatingBarIndicator(
                            rating: 6,
                            itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            ),
                            itemCount: 6,
                            itemSize: 10,
                            direction: Axis.horizontal,
                          ),
                          Text('5.0 (23 Reviews)',style: TextStyle(fontSize: 10, color: Colors.black),),
                        ],
                      ),
                      SizedBox(height: 5,)
                    ],
                  ),
                  ),
                );
              }),
            ),
          ),
          

        ],
      ),

    ),




    // *********** Bottom Navigation *************8
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