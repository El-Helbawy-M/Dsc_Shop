import 'package:flutter/material.dart';

import '../../Constants.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar(this.fun);
  final Function(Pages page) fun;
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  List choices = [Pages.Home, Pages.Favorite, Pages.Cart];
//to navigate through bottom navigation bar
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      widget.fun(choices[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTap,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey.shade400,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favorite'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
            ),
            label: 'Cart'),
      ],
    );
  }
}
