import 'package:dsc_shop/Data/Handlers/FavoritesHandler.dart';
import 'package:dsc_shop/Domain/Models/Product.dart';
import 'package:dsc_shop/Domain/Models/User.dart';
import 'package:flutter/material.dart';
import '../../Constants.dart';
import '../Screens/ProductDetailsScreen.dart';

class ClothItem extends StatefulWidget {
  const ClothItem(this.product, this.user, this.fun, this.check);

  final Product product;
  final AppUser user;
  final bool check;
  final Map<String, Object> Function(bool check) fun;

  @override
  _ClothItemState createState() => _ClothItemState();
}

class _ClothItemState extends State<ClothItem> {
  IconData enabledIcon;
  IconData disabledIcon;
  bool favorite = false;

  @override
  void initState() {
    super.initState();
    favorite = widget.check;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(widget.product, widget.user)));
          },
          child: Container(
            height: 180,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.shade600,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  '${widget.product.image}',
                ),
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(5, 5), // changes position of shadow
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.name,
                style: kTextClothTitleStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${widget.product.price}',
                    style: kTextClothPriceStyle,
                  ),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        favorite = !favorite;
                      });
                      await FavoriteHandler(widget.user.email).upDateFavorites(widget.fun(favorite));
                    },
                    child: Icon(
                      favorite ? Icons.favorite : Icons.favorite_outline,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
