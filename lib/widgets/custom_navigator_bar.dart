import 'package:flutter/material.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map' 
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions),
          label: 'Direction' 
        ),
      ] 
    );
  }
}