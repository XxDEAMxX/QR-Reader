import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';

class MapScreen extends StatelessWidget {

   

  MapScreen({super.key});
 
  @override
  Widget build(BuildContext context) {


    final arguments = ModalRoute.of(context)!.settings.arguments;

    final ScanModel scan = arguments as ScanModel;


    return Scaffold(
      appBar: AppBar(title: const Text('Mapa')),
        body: Center(
          child: Text(scan.valor),
        ),
      );
  }
}