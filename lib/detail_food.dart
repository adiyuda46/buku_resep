import 'dart:ui';

import 'package:flutter/material.dart';
import 'recepi.dart';

class DetailFood extends StatelessWidget {
  const DetailFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsFood =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    List<String> ingredients = argsFood['ingredients'];

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 100, right: 20, left: 20),
        child: Column(
          children: [
            Text(argsFood["title"],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ingredients",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                //Text(ingredients.length.toString(),),
                Text(
                  '${ingredients.length} items',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
            // expanded buat dati arry column ke list
            // atau list view dilarang di column dan row
            Expanded(
              child: ListView.builder(
                itemCount: ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final bahan = ingredients[index];
                  return Container(
                    child: Text(bahan),
                    padding: EdgeInsets.all(30),
                    margin:  EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20)
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
