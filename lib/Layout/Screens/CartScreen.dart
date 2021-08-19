import 'package:dsc_shop/Domain/Models/Product.dart';
import 'package:dsc_shop/Layout/widgets/customized_cart_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  Product product;

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // var stateManager = Provider.of<StateManager>(context);
    // stateManager.setData();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'DSC Shop',
          style: TextStyle(fontFamily: 'Lobster', fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          CustomizedCartCard(
            // title: widget.product.name,
            // category: widget.product.category,
            // description: widget.product.description,
            // price: widget.product.price,
          ),
          SizedBox(height: 20,),
          CustomizedCartCard(),
          SizedBox(height: 20,),
          CustomizedCartCard(),
          SizedBox(height: 20,),
          CustomizedCartCard(),
        ]),
      ),
    );
  }
}
