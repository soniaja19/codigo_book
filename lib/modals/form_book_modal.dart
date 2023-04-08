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
                      _myFormKey.currentState!
                          .validate(); //verifica si la función validator cumple o no
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
