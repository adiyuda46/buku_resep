import 'package:buku_resep/category_home.dart';
import 'package:buku_resep/detail_food.dart';
import 'package:buku_resep/recepi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
      "/": (context) => HomePage(), 
      "/recepi": (context) => Recepi(),
      "/detail_food": (context) => DetailFood()
      },
      initialRoute: "/",
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recepi",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: CategoryHome(),
    );
  }
}
