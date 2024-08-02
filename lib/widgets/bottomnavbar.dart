import 'package:flutter/material.dart';
import 'package:katalog_film/login.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key, required this.selectedItem});
  final int selectedItem;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedNavBar = 0;
  void changeSelectedNavBar(int index) {
    setState(() {
      selectedNavBar = index;
    });
    if (index == 0) {
      Navigator.pushNamed(context, '/movie');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/profile');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      currentIndex: widget.selectedItem,
      onTap: changeSelectedNavBar,
    );
  }
}
