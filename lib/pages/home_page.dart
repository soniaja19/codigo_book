import 'dart:math';

import 'package:codigo_books1/db/db_admin.dart';
import 'package:codigo_books1/modals/form_book_modal.dart';
import 'package:codigo_books1/models/book_model.dart';
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
    // showModalBottomSheet es la pntlla donde colocamos lo datos del libro
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            //se rodea de padding para que el Container pueda adaptarse al textfield
            padding: MediaQuery.of(context).viewInsets,
            child: FormBookModal(),
          );
          // con el then indicamos que se ejecute los datos de los libros indicados
        }).then((value) {
      setState(() {});
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
            FutureBuilder(
              future: DBAdmin().getBooks(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List<BookModels> myBooks = snap.data;
                  return myBooks.isNotEmpty
                      ? Padding(
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
                                  children: myBooks
                                      .map((item) => ItemSliderWidget(
                                            book: item,
                                          ))
                                      .toList(),
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
                              ListView.builder(
                                itemCount: myBooks.length,
                                physics:
                                    const NeverScrollableScrollPhysics(), //Para que el scroll se mueva
                                shrinkWrap:
                                    true, // con este parametro podemos manejar el scroll, es decir podemos visualizar todos los libros sin que aparezca error de tamaño
                                itemBuilder: (BuildContext context, int index) {
                                  return ItemHomeWidget(
                                    book: myBooks[index],
                                  );
                                  /*return Text(
                                books[index]["title"],*/
                                  /* books[index].toString()//para imprimir toda la lista,
                              );*/
                                },
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/cartulina.png",
                                  height: pyth * 0.1,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text("Por favor registra un libro")
                              ],
                            ),
                          ),
                        );
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
