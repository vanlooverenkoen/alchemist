import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('flutter smoke test', () {
    testWidgets('Flutter golden test', (WidgetTester tester) async {
      final mementoDebugDisableShadows = debugDisableShadows;
      // Enable shadows
      debugDisableShadows = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: ElevatedButton(
              onPressed: () {},
              onLongPress: () {},
              child: const Text('button'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(ElevatedButton),
        matchesGoldenFile('goldens/flutter_golden_test.png'),
      );

      // Set the flag back to normal
      debugDisableShadows = mementoDebugDisableShadows;
    });
  });
}
