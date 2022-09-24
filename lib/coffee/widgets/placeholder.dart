import 'package:flutter/material.dart';

class Placeholder extends StatelessWidget {
  const Placeholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Theme.of(context).colorScheme.primary,
        ),
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
      child: const SizedBox(
        width: 100,
        height: 100,
      ),
    );
  }
}
