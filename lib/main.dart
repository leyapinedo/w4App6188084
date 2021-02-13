import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
/*App Home*/
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeWork_MobileApp',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:BeautyShop(),
    );
  }
}
/*-----------------------------------------------------------*/
class BeautyShop extends StatefulWidget {
  @override
  _BeautyShopState createState() => _BeautyShopState();
}
/*Main Page*/
class _BeautyShopState extends State<BeautyShop>{
  List<ProductDetails> cart = [];
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BeautyShop'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'BeautyProductsList',),
              Tab(text: 'CheckOut',),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            //calcualte prices
            BeautyProductsList((chooseGame) {
              setState(() {
                cart.add(chooseGame);
                sum = 0;
                cart.forEach((item) {
                  sum = sum + item.cost;
                });
              });
            }),
            CheckOut(cart, sum),
          ],
        ),
      ),
    );
  }
}

/*-----------------------------------------------------------*/
/*Beauty Products List class*/
class BeautyProductsList extends StatelessWidget {
  final ValueSetter<ProductDetails> _valueSetter;
  BeautyProductsList(this._valueSetter);

  List<ProductDetails> items = [
    ProductDetails(image: 'assets/images/ChanelFoundation.jpg', name: 'Chanel Foundation', cost: 2500),
    ProductDetails(image: 'assets/images/Dior.jpg', name: 'Dior Backstage Foundation', cost: 1650),
    ProductDetails(image: 'assets/images/Emulsion.jpg', name: 'The History of Whoo Emulsion', cost: 3562),
    ProductDetails(image: 'assets/images/Loccitane.jpg', name: 'Loccitane Oil Serum', cost: 2700),
    ProductDetails(image: 'assets/images/Maybelline.png', name: 'Maybelline Mascara', cost: 129),
    ProductDetails(image: 'assets/images/Neo.png', name: 'Laneige Neo Cushion', cost: 1350),
    ProductDetails(image: 'assets/images/Pixi.jpg', name: 'Pixi Glow Tonic', cost: 590),
    ProductDetails(image: 'assets/images/Tarte.jpg', name: 'Tarte Shape Tape Concealer', cost: 1020),
    ProductDetails(image: 'assets/images/Toner.png', name: 'Paula\'s Choice Toner', cost: 900),
    ProductDetails(image: 'assets/images/YSL.jpg', name: 'YSL cushion', cost: 2750),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
        itemBuilder: (context, index){
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(items[index].image),
            ),
            title: Text(items[index].name),
            trailing: Text(
              '\฿${items[index].cost}',
              style: TextStyle(
                  color: Colors.black,fontSize: 20,
                  fontWeight: FontWeight.bold),),
            onTap: (){
              _valueSetter(items[index]);
            },
          );
        },
        separatorBuilder: (context, index){
          return Divider();
        },
        itemCount: items.length
    );
  }
}
/*-----------------------------------------------------------*/
/*Set data value*/
class ProductDetails {
  String image, name;
  int cost;

  ProductDetails({this.image, this.name, this.cost});
}
/*-----------------------------------------------------------*/

/*Summary*/
class CheckOut extends StatelessWidget{
  final cart;
  final sum;

  CheckOut(this.cart, this.sum);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.separated(
          itemBuilder: (context,index){
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cart[index].image),
              ),
              title: Text(cart[index].name),
              trailing: Text('\฿${cart[index].cost}',
                style: TextStyle(color: Colors.blueAccent,
                    fontSize: 20, fontWeight: FontWeight.bold),),
              onTap: (){

              },
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
          itemCount: cart.length,
          shrinkWrap: true,
        ),
        Divider(),
        Text('Total: \฿$sum'),
      ],
    );
  }
}

