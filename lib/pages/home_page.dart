import 'package:codigo_books1/db/db_admin.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                DBAdmin().getBooks();
              },
              child: const Text(
                "Select",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // DBAdmin admin = DBAdmin();
                // admin.inserbooks();
                DBAdmin().inserbooks();
              },
              child: const Text(
                "DataBase",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
