// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CoffeePage extends StatelessWidget {
  const CoffeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CoffeeView();
  }
}

class CoffeeView extends StatefulWidget {
  const CoffeeView({Key? key}) : super(key: key);

  @override
  State<CoffeeView> createState() => _CoffeeViewState();
}

class _CoffeeViewState extends State<CoffeeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Very Good Coffee!'),
      ),
      body: const _CoffeeBody(),
    );
  }
}

class _CoffeeBody extends StatelessWidget {
  const _CoffeeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Image.network(
                    "https://coffee.alexflipnote.dev/KoZr56EQPp8_coffee.jpg"),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                onPressed: () {},
                child: const Text('Get Another'),
              )),
              Expanded(
                  child: ElevatedButton(
                onPressed: () {},
                child: const Text('Save Coffee'),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
