import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:very_good_coffee/coffee/coffee.dart';

import '../../helpers/pump_app.dart';

class FakeCoffeeState extends Fake implements CoffeeState {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      FakeCoffeeEvent(),
    );
    registerFallbackValue(
      FakeCoffeeState(),
    );
  });

  group('CoffeePage', () {
    testWidgets('displays a CoffeeView', (tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(pumpMaterialApp(
          const CoffeePage(),
        ));
        expect(find.byType(CoffeeView), findsOneWidget);
      });
    });
  });
}
