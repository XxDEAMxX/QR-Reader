import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

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

          if(barcodeScanRes != '-1'){
            return;
          }

          final  scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
          final newScan = await scanListProvider.newScan(barcodeScanRes);
          launchURL(context, newScan);          
          
          scanListProvider.newScan('geo:45.280089,-75.922405');
          
        } 
      );
  }
}