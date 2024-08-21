import 'package:flutter/material.dart';
import 'package:recipe_app/widget/custom_container.dart';

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
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset(
              'assets/IMG_3667.HEIC',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kariwari Chicken Curry',
                  style: TextStyle(
                    color: Color(0xff4A7C74),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    CustomContainer(
                      title: 'Easy',
                    ),
                    CustomContainer(
                      title: '35 mnc',
                      icon: Icons.timelapse,
                    ),
                    CustomContainer(
                      title: 'ingredients',
                      icon: Icons.nightlife_rounded,
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  '''
                  Kensar is a smell coastal town of north Karnakate.
Kervori food is based on generous use of cosort.
Kansari chicken curey is cooked in cosonut gravy and with usa at vary logs oil. am shanng Authontic Kansari Rosize. Do try k. You are gaing to love t.
                  ''',
                  style: TextStyle(fontSize: 16, height: 1.5),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
