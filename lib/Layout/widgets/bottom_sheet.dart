import 'package:dsc_shop/Domain/Models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_button.dart';

Widget buildSheet(BuildContext context, Product product) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.baseline ,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 15.0),
                child: Text(
                  '\$${product.price}' ,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.green),
                ),
              ),
              Text('${product.category.toUpperCase()}', style: TextStyle(color: Colors.grey.shade500),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(product.name, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
          ),
          Text(product.description, style: TextStyle(fontWeight: FontWeight.normal)),
          SizedBox(
            height: 50,
          ),
          BottomButton(
            buttonTitle: 'Add to cart',
            onPress: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    ),
  );
}
