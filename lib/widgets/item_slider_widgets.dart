import 'dart:math';

import 'package:flutter/material.dart';

class ItemSliderWidget extends StatelessWidget {
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
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.pexels.com/photos/2954199/pexels-photo-2954199.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
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
                const Text(
                  "The Lord if the  ring: Chacter 2. Lorem 12314 hgutjahdvhjd",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  " J. R. R. Tolkien.",
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
