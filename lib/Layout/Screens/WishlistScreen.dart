import 'package:dsc_shop/Layout/widgets/bottom_navigation_bar.dart';
import 'package:dsc_shop/Layout/widgets/cloth_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../Data/DataBase/Api.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        padding: const EdgeInsets.all(15.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
          ),
          children: <Widget>[
            // ClothItem(),
            // ClothItem(),
            // ClothItem(),
            // ClothItem(),
            // ClothItem(),
            // ClothItem(),
            // ClothItem(),
            // ClothItem(),
          ],
        ),
      ),
    );
  }
}
