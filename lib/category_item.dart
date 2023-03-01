import 'package:flutter/material.dart';

class categoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String images;

  const categoryItem(
      {super.key, required this.id, required this.title, required this.images});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/recepi",
            arguments: {"id": id, "title": title});
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red,
            image:
                DecorationImage(image: NetworkImage(images), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 133, 128, 128),
                blurRadius: 8,
                offset: Offset(0, 5),
              )
            ]),
        child: Container(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.05, 0.5]),
          ),
        ),
      ),
    );
  }
}
