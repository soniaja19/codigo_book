import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? _myDatabase;

  static final DBAdmin _instance = DBAdmin._mandarina();
  DBAdmin._mandarina(); //se coloca el _ con el nombre mandarina, no es necesario colocar ese nombre.
  factory DBAdmin() {
    return _instance;
  }
  Future<Database?> _checkDatabase() async {
    _myDatabase ??= await _initDataBase();
    return _myDatabase;
  }

  //Creando base dedatos
  Future<Database> _initDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    // esto es para revisar en que carpeta se encuentra la BD print(directory);
    String pahtDatabase = join(directory.path, "BDBooks.db");
    return await openDatabase(
      pahtDatabase,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE BOOK(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, author TEXT, description TEXT, image TEXT)");
      },
    );
  }

  //Consultas

  getBooks() async {
    Database? db = await _checkDatabase();
    List data = await db!.rawQuery("SELECT * FROM Book");
    for (var element in data) {
      print(element);
    }

//////////Otra manera de imprimir la base de datos
    // data.forEach ((element) {
    //  print(element);
    //)};
  }

  //Inserciones
  inserbookRaw() async {
    Database? db = await _checkDatabase();
    db!.rawInsert(
        "INSERT INTO BOOK(title, author, description, image) VALUES ('El mundo es ancho y ajeno','Ciro Alegría','Lorem ipsum','https://......')");
  }

  //Inserciones, otro ejemplo de insercción
  inserbooks() async {
    Database? db = await _checkDatabase();
    db!.insert(
      "BOOK",
      {
        "title": "Yawar Fiesta",
        "author": "Jose María Arguedas",
        "description": "Lorem ipsum",
        "image": "https://......",
      },
    );
  }

  //Actualizaciones

  updateBook() async {
    {
      Database? db = await _checkDatabase();
    }
  }
}
