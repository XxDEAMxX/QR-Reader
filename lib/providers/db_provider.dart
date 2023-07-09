import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
        print('--------------------');
        await db.execute( '''
            CREATE TABLE Scan(
              id INTEGER PRIMARY KEY,
              tipo TEXT,
              valor TEXT
            )
          ''' );
      }
    );

  } 
}