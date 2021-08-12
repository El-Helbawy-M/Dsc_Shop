import 'package:flutter/material.dart';
import '../../Constants.dart';
import '../Screens/ProductDetailsScreen.dart';

class ClothItem extends StatefulWidget {

 ClothItem({ this.clothTitle,this.clothPrice, this.imageUrl});

 final String clothTitle;
 final int clothPrice;
 final String imageUrl;

  @override
  _ClothItemState createState() => _ClothItemState();
}

class _ClothItemState extends State<ClothItem> {
 IconData enabledIcon ;
 IconData disabledIcon ;

 bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails()));
              },
              child: Container(
                height: 150,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('Images/T-Shirt.jpg',)
                  ) ,
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            Positioned(
              child: GestureDetector(
                onTap: () {
                  // create fist stateful widget
              setState((){
                favorite = !favorite;
              });
                },
                child: Icon(
                  favorite? Icons.favorite : Icons.favorite_outline,
                  color: Colors.black,
                ),
              ),
              top: 5.0,
              right: 5.0,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
          'T-Shirt',
          style: kClothTitleStyle,
        ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Text(
            '\$185',
            style: kClothPriceStyle,
          ),
        ),
      ],
    );
  }
}
