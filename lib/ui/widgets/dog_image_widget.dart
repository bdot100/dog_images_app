import 'package:flutter/material.dart';

class DogImageWidget extends StatelessWidget {
  final String imageUrl;

  const DogImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.network(imageUrl));
  }
}
