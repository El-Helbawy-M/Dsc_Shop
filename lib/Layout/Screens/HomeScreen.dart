import 'dart:async';

import 'package:dsc_shop/Layout/Tools/StateManager.dart';
import 'package:dsc_shop/Layout/widgets/bottom_navigation_bar.dart';
import 'package:dsc_shop/Layout/widgets/cloth_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var stateManager = Provider.of<StateManager>(context);
    stateManager.setData();
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.notifications_none_outlined),
          ),
        ],
        toolbarHeight: 70,
        title: Text(
          'New Arrivals',
          style: TextStyle(color: Colors.white, letterSpacing: 2, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 20,
          ),
          children: (stateManager.data == null)
              ? []
              : stateManager.data
                  .map(
                    (product) => ClothItem(
                      clothTitle: product.name,
                      clothPrice: product.price,
                      imageUrl: product.image,
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
