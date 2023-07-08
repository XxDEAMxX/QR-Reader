import 'package:flutter/material.dart';
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
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}