import 'package:flutter/material.dart';

class CoffeeImage extends StatelessWidget {
  final String imageUrl;

  const CoffeeImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(
            5.0,
          ),
        ),
        child: Image.network(
          imageUrl,
        ),
      ),
    );
  }
}
