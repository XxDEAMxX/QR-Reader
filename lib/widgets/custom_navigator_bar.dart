import 'package:flutter/material.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {

    final currentIndex = 1;
    
    return BottomNavigationBar(
      currentIndex: currentIndex,
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