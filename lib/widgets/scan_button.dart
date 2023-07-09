import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed:() async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3DBBEF', 
            'Cancelar', 
            false, 
            ScanMode.QR,
          );

          final  scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

          if(barcodeScanRes != '-1'){
            scanListProvider.newScan(barcodeScanRes);
          }
          
        } 
      );
  }
}