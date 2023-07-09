
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/models/scan_model.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

export 'package:qr_reader/models/scan_model.dart';

class DBProvider{
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    print(join( documentsDirectory.path, 'ScansDB.db' ));


    
    if(_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {

    //Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'ScansDB.db' );
    print(path);

    //crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute( '''
            CREATE TABLE Scan(
              id INTEGER PRIMARY KEY,
              tipo TEXT,
              valor TEXT
            )
          ''' 
        );
      }
    );

  } 

  Future<int> newScanRaw( ScanModel nuevoScan ) async {

    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;
    //verificar la base de datos
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Scan( id, tipo, valor )
      VALUES( ${id}, '$tipo', '$valor'  )
    ''');

    return res;
  }

  Future<int> newScan (ScanModel nuevoScan) async {

    final db = await database;
    final res = await db.insert( 'Scan', nuevoScan.toJson() );

    return res;
  }
}