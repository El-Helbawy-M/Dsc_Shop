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
  IconData enabledIcon;
  IconData disabledIcon;
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    var stateManager = Provider.of<StateManager>(context);
    stateManager.setData();
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: Colors.grey.shade300,
              width: double.infinity,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('Images/brunch1.png'),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Amira Ezz',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lobster'),
                  ),
                  Text('miraezz14@gmail.com', style: TextStyle(fontSize: 15)),
                  SizedBox(height: 30.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Light Mode'),
                        IconButton(icon: Icon(Icons.star_half), onPressed: (){},),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ),
      ),      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.notifications_none_outlined),
          ),
        ],
        toolbarHeight: 70,
        title: Text(
          'New Arrivals',
          style: TextStyle(color: Colors.white,
              letterSpacing: 2,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: (stateManager.data == null)
            ? Center(child: CircularProgressIndicator(),)
            : GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 20,
          ),
          children: stateManager.data
              .map(
                (product) => ClothItem(
                  product: product,
                  onPressed:(){
                  setState(() {
                    favorite = ! favorite;
                  });
                  },
                  icon: favorite ? Icons.favorite : Icons.favorite_outline,
                  ),
          )
              .toList(),
        ),
      ),
    );
  }
}
