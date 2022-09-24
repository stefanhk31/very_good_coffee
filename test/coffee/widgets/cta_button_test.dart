import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/coffee/coffee.dart';

void main() {
  group('CtaButton', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CtaButton(
              onPressed: () {},
              text: 'TEST',
              padding: const EdgeInsets.all(0.0),
              color: Colors.black,
            ),
          ),
        ),
      );

      expect(find.byType(CtaButton), findsOneWidget);
    });

    testWidgets('is tappable', (tester) async {
      var tapCounter = 0;
      void incrementCounter() {
        tapCounter++;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CtaButton(
              onPressed: incrementCounter,
              text: 'TEST',
              padding: const EdgeInsets.all(0.0),
              color: Colors.black,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CtaButton));
      await tester.pumpAndSettle();

      expect(tapCounter, equals(1));
    });
  });
}
