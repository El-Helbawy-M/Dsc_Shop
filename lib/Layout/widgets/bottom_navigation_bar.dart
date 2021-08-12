import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {


  int _selectedIndex = 1;
//to navigate through bottom navigation bar
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
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
        BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search,), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite,), label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag,), label: 'cart'),
      ],
    );
  }
}
