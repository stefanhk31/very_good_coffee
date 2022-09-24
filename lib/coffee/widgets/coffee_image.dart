import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:very_good_coffee/coffee/widgets/placeholder.dart';

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
      child: imageUrl.isNotEmpty
          ? FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: imageUrl,
            )
          : const StartPlaceholder(),
    );
  }
}
