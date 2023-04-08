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

//Nuestro modelo creado ahora tiene una función convertirAMapa para ello
// se requiere de utilizr toJson, el cual retorna los parámetros asiganados
  Map<String, dynamic> toJson() => {
        "title": title,
        "author": author,
        "image": image,
        "description": description,
      };
}
