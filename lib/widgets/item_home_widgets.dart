import 'dart:math';

import 'package:codigo_books1/models/book_model.dart';
import 'package:flutter/material.dart';

class ItemHomeWidget extends StatelessWidget {
  BookModels book;

  ItemHomeWidget({required this.book});
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
              book.image,
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
                Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  book.author,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  book.description,
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
