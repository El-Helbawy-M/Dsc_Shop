import 'package:dsc_shop/Domain/Models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_shop/Constants.dart';

class CustomizedCartCard extends StatelessWidget {
  final Product product;

  CustomizedCartCard(this.product);

  @override
  Widget build(BuildContext context) {
    print(product.image);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
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
                fit: BoxFit.fill,
                image: NetworkImage(
                  product.image,
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
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.toUpperCase(),
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$${product.price.toString()}",
                    style: kTextClothPriceStyle,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.shopping_cart),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
