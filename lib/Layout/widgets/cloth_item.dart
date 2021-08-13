import 'package:flutter/material.dart';
import '../../Constants.dart';
import '../Screens/ProductDetailsScreen.dart';

class ClothItem extends StatefulWidget {
  ClothItem({this.clothTitle, this.clothPrice, this.imageUrl});

  final String clothTitle;
  final double clothPrice;
  final String imageUrl;

  @override
  _ClothItemState createState() => _ClothItemState();
}

class _ClothItemState extends State<ClothItem> {
  IconData enabledIcon;
  IconData disabledIcon;

  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails()));
              },
              child: Container(
                height: 180,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        '${widget.imageUrl}',
                      )),
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            Positioned(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    favorite = !favorite;
                  });
                },
                child: Icon(
                  favorite ? Icons.favorite : Icons.favorite_outline,
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
            widget.clothTitle,
            style: kClothTitleStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            '\$${widget.clothPrice}',
            style: kClothPriceStyle,
          ),
        ),
      ],
    );
  }
}
