import 'package:flutter/material.dart';
import 'package:mausam/Activities/home.dart';
import 'package:mausam/Activities/loading.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        "/": (context) => Loading(),
        "/home": (context) => Home(),
        "/loading": (contex) => Loading(),
      },
    ),
  );
}
