import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:qr_reader/screens/screens.dart';
import 'package:qr_reader/widgets/scan_button.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Historia')),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.delete)
          )
        ],
      ),
      
      body: _HomeScreenBody(),
      
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = 1;

    switch(currentIndex){
      
      case 0:
        return MapsScreen();

      case 1:
        return AddressesScreen();

      default:
        return MapsScreen();
    }
  }
}