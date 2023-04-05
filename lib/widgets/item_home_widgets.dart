import 'dart:math';

import 'package:flutter/material.dart';

class ItemHomeWidget extends StatelessWidget {
  const ItemHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double pyth = sqrt(pow(height, 2) + pow(width, 2));

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              "https://images.pexels.com/photos/5913138/pexels-photo-5913138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              width: pyth * 0.12,
              height: pyth * 0.16,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  " Ther Lord of the ring",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  "  J. R. R. Tolkien.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  " Su historia se desarrolla en la Tercera Edad del Sol de la Tierra Media, un lugar ficticio poblado por hombres y otras razas antropomorfas como los hobbits, los elfos o los enanos, así como por muchas otras criaturas reales y fantásticas. La novela narra el viaje del protagonista principal, Frodo Bolsón, hobbit de la Comarca, para destruir el Anillo Único y la consiguiente guerra que provocará el enemigo para recuperarlo, ya que es la principal fuente de poder de su creador, el Señor oscuro Sauron.",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.70),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
