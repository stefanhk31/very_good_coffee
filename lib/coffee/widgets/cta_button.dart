import 'package:flutter/material.dart';

class CtaButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final EdgeInsetsGeometry padding;
  final Color color;

  const CtaButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.padding,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            color,
          ),
        ),
      ),
    );
  }
}
