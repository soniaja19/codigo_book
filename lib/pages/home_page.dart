import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double pyth = sqrt(pow(height, 2) + pow(width, 2));
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: pyth * 0.42,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.pexels.com/photos/1893264/pexels-photo-1893264.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                ),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    width: pyth * 0.35,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Buscar libro...",
                        hintStyle: const TextStyle(
                          fontSize: 14.0,
                        ),
                        suffixIcon: const Icon(
                          Icons.search,
                          size: 19,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Row(
                      children: const [
                        Text(
                          "Buscar \ntus libros \nfavoritos",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
