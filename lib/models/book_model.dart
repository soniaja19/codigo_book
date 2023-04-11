class BookModels {
  int? id; // se va utilizar para registrr los datos
  String title;
  String author;
  String image;
  String description;
  BookModels({
    this.id,
    required this.title,
    required this.author,
    required this.image,
    required this.description,
  });

//Fron Json

//Para convertir una mapa en un m0delo de mapa se utiliza el Fron Json
  factory BookModels.fromJson(Map<String, dynamic> mapa) => BookModels(
        id: mapa["id"],
        title: mapa["title"],
        author: mapa["author"],
        image: mapa["image"],
        description: mapa["description"],
      );

//Nuestro modelo creado ahora tiene una función convertirAMapa para ello
// se requiere de utilizar toJson (de modelo a mapa), el cual retorna los parámetros asiganados
  Map<String, dynamic> toJson() => {
        // "id": id,
        "title": title,
        "author": author,
        "image": image,
        "description": description,
      };
}
