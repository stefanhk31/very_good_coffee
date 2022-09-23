import 'package:flutter/material.dart';
import 'package:very_good_coffee/coffee/view/coffee_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Very Good Coffee',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const CoffeePage(),
    );
  }
}
