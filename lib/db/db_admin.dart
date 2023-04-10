import 'dart:io';

import 'package:codigo_books1/models/book_model.dart';
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
// para obtener la información de la bd
  getBooksRaw() async {
    Database? db = await _checkDatabase();
    //List data = await db!.rawQuery("SELECT * FROM Book");
    List data = await db!.rawQuery("SELECT id, title * FROM Book WHERE id = 3");
    for (var element in data) {
      print(element);
    }

//////////Otra manera de imprimir la base de
    // data.forEach ((element) {
    //  print(element);
    //)};
  }

//segunda opcion para obtener la información de bd
  Future<List<BookModels>> getBooks() async {
    Database? db = await _checkDatabase();
    // List data = await db!.query("Book"); //Para conocer toda la base de datos
    //Para conocer las columnas que deseo mostrar
    List<Map<String, dynamic>> data = await db!.query(
      "Book",
      orderBy: //ordenar por
          "id DESC", //Para indicar que los datos ingresados se registren de forma descendente, el primer lugar
    );
    // await db!.query("Book", columns: ["id", "author"], where: "id = 3");
    List<BookModels> books = data.map((e) => BookModels.fromJson(e)).toList();
// Este método es el más utilizado

//List<BookModels> books = []; //Estmo generando una lista vacía para ser llenado con lo siguientes datos
    //Primera opción
    // data.forEach ((element) {
    //   BookModels model = BookModels(
    //     title: element["title"],
    //     author: element["author"],
    //     image: element["image"],
    //     description: element["description"],
    //   );
    //   books.add(model);
    // });

    //Segunda opción
    // for (var item in data) {
    //   books.add(BookModels(
    //     title: item["title"],
    //     author: item["author"],
    //     image: item["image"],
    //     description: item["description"],
    //   ));
    // }

//Primera  opción para convertir lista de modelo
    // ignore: avoid_function_literals_in_foreach_calls
    // data.forEach((element) {
    //   BookModels model = BookModels.convertirMapaAModelo(element);
    //   books.add(model);
    // });

//Se puede utilizar la segunda opción para convertir lista de modelo
    for (var item in data) {
      books.add(BookModels.fromJson(item));
    }

//tercera opción

    return books;
  }

  //Inserciones
  inserbookRaw() async {
    Database? db = await _checkDatabase();
    db!.rawInsert(
        "INSERT INTO BOOK(title, author, description, image) VALUES ('El mundo es ancho y ajeno','Ciro Alegría','Lorem ipsum','https://......')");
  }

  //Inserciones, otro ejemplo de insercción
  Future<int> insertBooks(
      //Enviar Parámetros(primera opción)
      // String title,
      // String author,
      // String image,
      // String description,

      // Segunda opción, También se puede colocar la siguiente expresión tipo mapa
      // Map<String, dynamic> data,

// tecerra opción envuar un parámetro creado
      BookModels model) async {
    Database? db = await _checkDatabase();
    int value = await db!.insert(
      "BOOK",
      //{
      //Se comenta los parámetros porque supera los tres elementisos
      // "title": title,
      // "author": author,
      // "image": image,
      // "description": description,

      //Se utiliza el parámetro data que hemos creadoo.
      // data,
      //},

      // {
      //   "title": model.title,
      //   "author": model.author,
      //   "image": model.image,
      //   "description": model.description,
      // }

      model.toJson(),
    );
    return value;
  }

  //Actualizaciones
  //Primera opción para actualizar
  updateBookRaw() async {
    Database? db = await _checkDatabase();
    int value = await db!
        .rawUpdate("UPDATE Book set title = 'Aves sin nido' WHERE id = 4");
    print(value);
  }

  //Segunda opción para actualizar
  updateBook() async {
    Database? db = await _checkDatabase();
    int value = await db!.update(
      "Book",
      {
        "title": "1992",
      },
      where:
          "id = 3", //es importante colocar esta sentencia si se desea actualizar solo un dato.
    );
  }

  //Eliminar
  //Primera opción para eliminar
  deleteBookRaw() async {
    Database? db = await _checkDatabase();
    int value = await db!.rawDelete("DELATE FROM Book WHERE id = 11");
    print(value);
  }

  //Segundo opción para eliminar
  deleteBook() async {
    Database? db = await _checkDatabase();
    int value = await db!.delete("Book", where: "id=11");
    print(value);
  }
}
