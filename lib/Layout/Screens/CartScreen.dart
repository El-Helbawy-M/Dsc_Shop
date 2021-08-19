import 'package:dsc_shop/Data/Handlers/CartHandler.dart';
import 'package:dsc_shop/Layout/Tools/StateManager.dart';
import 'package:dsc_shop/Layout/Widgets/customized_cart_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen(this.email);
  final String email;

  @override
  Widget build(BuildContext context) {
    var stateManager = Provider.of<StateManager>(context);
    if (stateManager.cart == null) stateManager.getCart(email);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: Text(
          'DSC Shop',
          style: TextStyle(fontFamily: 'Lobster', fontSize: 25),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: (stateManager.cart == null)
            ? Center(child: CircularProgressIndicator())
            : Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView(children: stateManager.data.map((e) => CustomizedCartCard(e)).toList()),
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: TextButton(
                      onPressed: () async {
                        await CartHandler(email).pay();
                        stateManager.upDateData([]);
                      },
                      child: Text("Pay", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Lobster")),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
