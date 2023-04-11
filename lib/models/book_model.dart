class BookModels {
  String title;
  String author;
  String image;
  String description;
  BookModels({
    required this.title,
    required this.author,
    required this.image,
    required this.description,
  });

//Fron Json

//Para convertir una mapa en un m0delo de mapa se utiliza el Fron Json
  factory BookModels.fromJson(Map<String, dynamic> mapa) => BookModels(
        title: mapa["title"],
        author: mapa["author"],
        image: mapa["image"],
        description: mapa["description"],
      );

//Nuestro modelo creado ahora tiene una función convertirAMapa para ello
// se requiere de utilizar toJson (de modelo a mapa), el cual retorna los parámetros asiganados
  Map<String, dynamic> toJson() => {
        "title": title,
        "author": author,
        "image": image,
        "description": description,
      };
}
