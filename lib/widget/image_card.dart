import 'package:flutter/material.dart';
import 'package:recipe_app/models/image_model.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({super.key, required this.image});
  final ImageModel image;

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            widget.image.image,
            fit: BoxFit.cover,
            height: 200,
            width: 175,
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.5),
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
