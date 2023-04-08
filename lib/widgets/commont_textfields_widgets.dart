import 'package:flutter/material.dart';

class CommonTextFieldWidget extends StatelessWidget {
  String label;
  String hintText;
  IconData icon;
  int? maxLines; //(opcional)
  TextEditingController controller;

  CommonTextFieldWidget(
      {required this.hintText,
      required this.icon,
      required this.label,
      this.maxLines,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      //Se rodió la columna con un container para colocarles una sombra
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " $label:",
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 12,
                    offset: const Offset(4, 4)),
              ],
            ),
            child: TextFormField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hintText,
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  icon,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                //para que desaparezca el borde
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return "Campo Obligatorio";
                }
                if (value != null && value.length < 8) {
                  return "El campo debe tener más de 8 caracteres";
                }
                return null;
                //Retorna un mensaje cuando no se ingresa datos
              },
            ),
          ),
        ],
      ),
    );
  }
}
