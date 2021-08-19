import 'package:dsc_shop/Domain/Models/User.dart';
import 'package:dsc_shop/Layout/Tools/SearchManager.dart';
import 'package:dsc_shop/Layout/Tools/StateManager.dart';
import 'package:dsc_shop/Layout/Widgets/bottom_navigation_bar.dart';
import 'package:dsc_shop/Layout/Widgets/cloth_item.dart';
import 'package:dsc_shop/Layout/Widgets/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../Constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget page;
  @override
  Widget build(BuildContext context) {
    var stateManager = Provider.of<StateManager>(context);
    AppUser user = ModalRoute.of(context).settings.arguments;
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
                  Text(
                    'Amira Ezz',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Lobster'),
                  ),
                  Text('miraezz14@gmail.com', style: TextStyle(fontSize: 15)),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Light Mode'),
                        IconButton(
                          icon: Icon(Icons.star_half),
                          onPressed: () {},
                        ),
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
      ),
      bottomNavigationBar: BottomNavBar((Pages value) {
        setState(() {
          stateManager.clear();
          page = pages(user)[value];
        });
      }),
      body: page == null ? Home(user) : page,
    );
  }
}

class Home extends StatelessWidget {
  const Home(this.user);
  final AppUser user;
  @override
  Widget build(BuildContext context) {
    var stateManager = Provider.of<StateManager>(context);
    if (stateManager.data == null) stateManager.setData(user);
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10, top: 70),
            child: (stateManager.data == null)
                ? Center(child: CircularProgressIndicator())
                : GridView(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 20,
                    ),
                    children: (stateManager.result != null)
                        ? [
                            ClothItem(
                              stateManager.result,
                              user,
                              (bool value) => (value) ? stateManager.addFavorite(stateManager.result) : stateManager.subFavorite(stateManager.result.name),
                              stateManager.favorates.containsKey(stateManager.result.name),
                            )
                          ]
                        : stateManager.data.map(
                            (product) {
                              return ClothItem(
                                product,
                                user,
                                (bool value) => (value) ? stateManager.addFavorite(product) : stateManager.subFavorite(product.name),
                                stateManager.favorates.containsKey(product.name),
                              );
                            },
                          ).toList(),
                  ),
          ),
          ChangeNotifierProvider(create: (context) => SearchManager(), child: SearchBar(stateManager.data, (list) => stateManager.upDateData(list), (value) => stateManager.setResult(value))),
        ],
      ),
    );
  }
}

// WishListScreen(AppUser("Mohamed", "hamada.helbawy.hh@gmail.com", "")),
