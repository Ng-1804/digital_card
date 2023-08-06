import 'package:flutter/material.dart';
Widget makeTitle(String title, context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.07,
    child: Card(
      elevation: 3.0,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}