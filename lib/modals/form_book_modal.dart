import 'package:codigo_books1/db/db_admin.dart';
import 'package:codigo_books1/models/book_model.dart';
import 'package:codigo_books1/widgets/commont_textfields_widgets.dart';
import 'package:flutter/material.dart';

class FormBookModal extends StatefulWidget {
  @override
  State<FormBookModal> createState() => _FormBookModalState();
}

class _FormBookModalState extends State<FormBookModal> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _authorController = TextEditingController();

  final TextEditingController _imageController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  //crear un key
  final _myFormKey = GlobalKey<FormState>();

  void registerBook() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.greenAccent,
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        content: Row(
          children: const [
            Icon(
              Icons.check,
              color: Colors.white,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                "El libro se registro correctamente",
              ),
            ),
          ],
        ),
      ),
    );

    if (_myFormKey.currentState!.validate()) {
      //Registrar un libro
      // Se puede utilizar las siguiente expresiones, pero es tedioso por tener más de 3 valores
      // String title = _titleController.text;
      // String author = _authorController.text;
      // String image = _imageController.text;
      // String description = _descriptionController.text;
      // DBAdmin().insertBooks(title, author, image, description);

      // Map<String, dynamic> bookMap = {
      //   "title": _titleController.text,
      //   "author": _authorController.text,
      //   "image": _imageController.text,
      //   "description": _descriptionController.text,
      // };
      // DBAdmin().insertBooks(bookMap);

      //Aquí se creó un modelo, una instancia
      BookModels myBook = BookModels(
        title: _titleController.text,
        author: _authorController.text,
        image: _imageController.text,
        description: _descriptionController.text,
      );
      DBAdmin().insertBooks(myBook).then((value) {
        if (value >= 0) {
          //Se agregó el libro correctamente
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.greenAccent,
              duration: const Duration(seconds: 5),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              content: Row(
                children: const [
                  Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      "El libro se registro correctamente",
                    ),
                  ),
                ],
              ),
            ),
          );
          Navigator.pop(context);
        } else {}
      }).catchError((error) {
        print(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.0),
          topRight: Radius.circular(36.0),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          //la columna fue rodeado de Form para utilizar la validación, debido a que estamos utilizando el FormTextField
          key: _myFormKey,
          child: Column(mainAxisSize: MainAxisSize.min,
              //mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Agregar Libro",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CommonTextFieldWidget(
                  hintText: "Ingresa un título",
                  icon: Icons.rocket,
                  label: "Titulo",
                  controller: _titleController,
                ),
                CommonTextFieldWidget(
                  controller: _authorController,
                  hintText: "Ingresa un autor",
                  icon: Icons.person,
                  label: "Autor",
                ),
                CommonTextFieldWidget(
                  hintText: "Ingresa el url de la portada",
                  icon: Icons.image,
                  label: "Portada",
                  controller: _imageController,
                ),
                CommonTextFieldWidget(
                  hintText: "Ingresa una descripción",
                  icon: Icons.view_headline,
                  label: "Descripción",
                  maxLines: 3,
                  controller: _descriptionController,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      //Guardar los datos del Libro

                      registerBook();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff22223d),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                    child: const Text(
                      "Agregar",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
