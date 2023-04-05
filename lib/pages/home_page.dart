import 'dart:math';

import 'package:codigo_books1/widgets/commont_textfields_widgets.dart';
import 'package:codigo_books1/widgets/item_home_widgets.dart';
import 'package:codigo_books1/widgets/item_slider_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  showFormBook() {
    //al convertir nuesto stl a stf el context es manejado por el stf, solo es necesario asignar el parametro builder.
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            //se rodea de padding para que el Container pueda adaptarse al textfield
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36.0),
                  topRight: Radius.circular(36.0),
                ),
              ),
              child: Column(mainAxisSize: MainAxisSize.min,
                  //mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Agregar Libro",
                    ),
                    CommonTextFieldWidget(),
                    CommonTextFieldWidget(),
                    CommonTextFieldWidget(),
                    CommonTextFieldWidget(),
                  ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double pyth = sqrt(pow(height, 2) + pow(width, 2));
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          showFormBook();
          //Mostrar Formulario
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xff22223d),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text(
                "Agregar",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 15.0,
                          offset: const Offset(4, 4),
                        ),
                      ]),
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
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Mis libros favoritos",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ItemSliderWidget(),
                        ItemSliderWidget(),
                        ItemSliderWidget(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "Lista General",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const ItemHomeWidget(),
                  const ItemHomeWidget(),
                  const ItemHomeWidget(),
                  const ItemHomeWidget(),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
