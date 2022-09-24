import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:very_good_coffee/coffee/view/coffee_page.dart';
import 'package:very_good_coffee/ui/colors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Very Good Coffee',
      theme: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
          background: CoffeeColors.lightGray,
          primary: CoffeeColors.lightBrown,
          secondary: CoffeeColors.darkBrown,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: CoffeeColors.lightBrown,
          secondary: CoffeeColors.darkBrown,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: CoffeeColors.darkGray,
        ),
      ),
      home: const LoaderOverlay(
        child: CoffeePage(),
      ),
    );
  }
}
