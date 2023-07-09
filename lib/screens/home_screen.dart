import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
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

    //Obtener el selected manu opt
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    //Todo: temporalmente leer la base de datos
    //DBProvider.db.newScan(tempScan);
    DBProvider.db.deleteAllScan();

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