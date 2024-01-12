import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('flutter smoke test', () {
    testWidgets('Flutter golden test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ElevatedButton(
            style: const ButtonStyle(
              elevation: MaterialStatePropertyAll(0),
            ),
            onPressed: () {},
            onLongPress: () {},
            child: const Text('button'),
          ),
        ),
      );
      debugDisableShadows = true;
      await expectLater(
        find.byType(ElevatedButton),
        matchesGoldenFile('goldens/flutter_golden_test.png'),
      );
    });
  });
}
