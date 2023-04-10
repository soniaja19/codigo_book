import 'dart:math';

import 'package:flutter/material.dart';

class ItemSliderWidget extends StatelessWidget {
  Map book;

  ItemSliderWidget({required this.book});

  Map<int, Color> colors = {
    1: const Color(0xffFFC2D0),
    2: const Color(0xffFFCE7F),
    3: const Color(0xffffc8dd),
    4: const Color(0xffa3b18a),
    5: const Color(0xffb5838d),
    6: const Color(0xffa7c957),
    7: const Color(0xffa5a58d),
    8: const Color(0xffb08968),
    9: const Color(0xfff1c0e8),
    10: const Color(0xffa78a7f),
  };

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double pyth = sqrt(pow(height, 2) + pow(width, 2));

    int index = (Random().nextInt(10) + 1);

    return Container(
      margin: EdgeInsets.only(right: 16, top: pyth * 0.038),
      width: pyth * 0.25,
      child: Column(
        children: [
          Container(
            width: pyth * 0.25,
            height: pyth * 0.18,
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: pyth * 0.028,
                  child: Container(
                    height: pyth * 0.19,
                    width: pyth * 0.14,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          blurRadius: 12,
                          offset: const Offset(4, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.amber,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          book["image"],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  book["title"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  book["author"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.65),
                    height: 1.1,
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
