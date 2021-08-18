import 'package:dsc_shop/Domain/Models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_shop/Constants.dart';
import 'package:provider/provider.dart';

class CustomizedCartCard extends StatelessWidget {
Product product;
String title, description, category;
double price;
CustomizedCartCard({this.product, this.description, this.title, this.category, this.price});
  @override
  Widget build(BuildContext context) {
    return   Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Container(
          padding: EdgeInsets.all(10.0),
          width: 160,
          height: 190,
          decoration: BoxDecoration(
            color: Colors.pink.shade200,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'Images/login.png',
                ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(5, 5), // changes position of shadow
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left:25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("category"),
                SizedBox(
                  height: 10,
                ),
                Text("title"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "description",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'price',
                  style: kTextClothPriceStyle,
                ),
               Align(
                 alignment: Alignment.centerRight,
                 child:Icon(Icons.shopping_cart),
               )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
