import 'dart:ui';

import 'package:buku_resep/dummy_data.dart';
import 'package:buku_resep/models/food.dart';
import 'package:flutter/material.dart';
import 'detail_food.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';

class Recepi extends StatefulWidget {
  @override
  State<Recepi> createState() => _RecepiState();
}

class _RecepiState extends State<Recepi> {

    bool isFav = false; // validasi tombol favorit
    

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsRecipe =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    List<Food> filterFood = dummy_food.where((food) {
      return food.category.contains(argsRecipe['id']);
    }).toList();

  

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          argsRecipe["title"],
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: filterFood.length,
          itemBuilder: (BuildContext context, int index) {
            final food = filterFood[index];
            // tampilkan detail food
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/detail_food", arguments: {
                  "title": food.title,
                  "ingredients": food.ingredients
                });
              },
              // tampilkan menu makanan
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(bottom: 10),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(food.imageUrl),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    " ${food.duration} menit",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isFav = !isFav;
                                      food.isFavorit = isFav;
                                    });
                                    print(food.isFavorit);
                                  },
                                  icon: Icon(
                                    food.isFavorit
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
