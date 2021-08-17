import 'package:dsc_shop/Domain/Models/User.dart';
import 'package:dsc_shop/Layout/Tools/SearchManager.dart';
import 'package:dsc_shop/Layout/Tools/StateManager.dart';
import 'package:dsc_shop/Layout/Widgets/cloth_item.dart';
import 'package:dsc_shop/Layout/Widgets/searchBar.dart';
import 'package:dsc_shop/Layout/widgets/bottom_navigation_bar.dart';
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
    if (stateManager.data == null) stateManager.setData(AppUser("Mohamed", "hamada.helbawy.hh@gmail.com", ""));
    return Scaffold(
      drawer: Drawer(),
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
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
                      children: stateManager.data.map(
                        (product) {
                          return ClothItem(
                            product,
                            stateManager.user.email,
                            (bool value) => (value) ? stateManager.addFavorite(product) : stateManager.subFavorite(product.name),
                            stateManager.favorates.containsKey(product.name),
                          );
                        },
                      ).toList(),
                    ),
            ),
            ChangeNotifierProvider(create: (context) => SearchManager(), child: SearchBar(stateManager.data)),
          ],
        ),
      ),
    );
  }
}
