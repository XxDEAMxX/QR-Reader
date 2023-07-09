import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';


class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scan = [];
  String selectType = 'http';

  Future<ScanModel> newScan(String valor) async {
    final newScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.newScan(newScan);
    // Asignar el ID de la base de datos al modelo
    newScan.id = id;

    if(selectType == newScan.tipo){
      scan.add(newScan);
      notifyListeners();
    }
    return newScan;
  }

  loadScan() async {
    final scan = await DBProvider.db.getAllScans();
    this.scan = [...scan];
    notifyListeners();
  }

  loadScanType(String type) async{
    final scan = await DBProvider.db.getAllTypeScans(type);
    this.scan = [...scan];
    selectType = type; 
    notifyListeners();
  }

  deleteAll() async {

    await DBProvider.db.deleteAllScan();
    this.scan = [];
    notifyListeners();

  }

  deleteScanId(int id) async {
    await DBProvider.db.deleteScan(id);
    loadScanType(selectType);
  }
}