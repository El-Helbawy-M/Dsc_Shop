import 'package:dsc_shop/Domain/Models/Product.dart';
import 'package:flutter/cupertino.dart';

import 'bottom_button.dart';

Widget buildSheet(BuildContext context, Product product) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              '\$${product.price}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(product.name, style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 2)),
          ),
          Text(product.description, style: TextStyle(fontWeight: FontWeight.normal)),
          SizedBox(
            height: 70,
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
