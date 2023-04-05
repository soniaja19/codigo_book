import 'package:flutter/material.dart';

class CommonTextFieldWidget extends StatelessWidget {
  String label;
  String hintText;
  IconData icon;
  int? maxLines; //(opcional)
  CommonTextFieldWidget({
    required this.hintText,
    required this.icon,
    required this.label,
    this.maxLines,
  });

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
          Text(
            " $label:",
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            child: TextField(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
