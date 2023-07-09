import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;
    
    
    return BottomNavigationBar(
      onTap: (i) {
        uiProvider.selectedMenuOpt = i;
      },
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map' ,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions),
          label: 'Direction' 
        ),
      ] 
    );
  }
}