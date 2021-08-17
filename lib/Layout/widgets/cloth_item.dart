import 'package:dsc_shop/Data/Handlers/FavoritesHandler.dart';
import 'package:dsc_shop/Domain/Models/Product.dart';
import 'package:flutter/material.dart';
import '../../Constants.dart';
import '../Screens/ProductDetailsScreen.dart';

class ClothItem extends StatefulWidget {
  const ClothItem(this.product, this.email, this.fun, this.check);

  final Product product;
  final String email;
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
        Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(widget.product)));
              },
              child: Container(
                height: 180,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        '${widget.product.image}',
                      )),
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            Positioned(
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    favorite = !favorite;
                  });
                  await FavoriteHandler(widget.email).upDateFavorites(widget.fun(favorite));
                },
                child: Icon(
                  favorite ? Icons.favorite : Icons.favorite_outline,
                  color: Colors.black,
                ),
              ),
              top: 5.0,
              right: 5.0,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            widget.product.name,
            style: kClothTitleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            '\$${widget.product.price}',
            style: kClothPriceStyle,
          ),
        ),
      ],
    );
  }
}
