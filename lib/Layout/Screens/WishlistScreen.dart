import 'package:dsc_shop/Domain/Models/User.dart';
import 'package:dsc_shop/Layout/Tools/StateManager.dart';
import 'package:dsc_shop/Layout/Widgets/cloth_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen(this.user);
  final AppUser user;
  @override
  Widget build(BuildContext context) {
    var stateManager = Provider.of<StateManager>(context);
    if (stateManager.favorates == null) stateManager.getFavoirtes(user);
    return (stateManager.data == null)
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
              ),
              children: stateManager.data.map(
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
          );
  }
}
