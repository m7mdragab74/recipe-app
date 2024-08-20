import 'package:flutter/material.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff4A7C74),
            size: 29,
          ),
        ),
        actions: const [
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: 29,
          ),
          SizedBox(
            width: 19,
          ),
          Icon(
            Icons.play_arrow_outlined,
            size: 29,
            color: Colors.black,
          ),
          SizedBox(
            width: 19,
          ),
          Icon(
            Icons.shopping_cart_outlined,
            size: 29,
            color: Colors.black,
          ),
          SizedBox(
            width: 19,
          ),
          Icon(
            Icons.share,
            size: 29,
            color: Colors.black,
          ),
          SizedBox(
            width: 29,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.asset(
              'assets/IMG_3667.HEIC',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Text(
              'Kariwari Chicken Curry',
              style: TextStyle(
                color: Color(0xff4A7C74),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
