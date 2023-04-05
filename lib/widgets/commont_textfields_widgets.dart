import 'package:flutter/material.dart';

class CommonTextFieldWidget extends StatelessWidget {
  const CommonTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      //Se rodió la columna con un container para colocarles una sombra
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(" Título"),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Ingresando al título del libro....",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.rocket,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
