import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';


class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scan = [];
  String selectType = 'http';

  newScan(String valor) async {
    final newScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.newScan(newScan);
    // Asignar el ID de la base de datos al modelo
    newScan.id = id;

    if(selectType == newScan.tipo){
      scan.add(newScan);
      notifyListeners();
    }
  }
}