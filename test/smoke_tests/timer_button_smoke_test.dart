import 'dart:async';

import 'package:alchemist/src/golden_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(elevation: MaterialStatePropertyAll(0)),
      onPressed: () {
        Timer(Duration.zero, () {});
      },
      child: const Text('Button'),
    );
  }
}

void main() {
  group('smoke test', () {
    goldenTest(
      'succeeds after tapping button with timer',
      fileName: 'timer_button_smoke_test',
      pumpBeforeTest: (tester) async {
        await tester.pumpAndSettle();
        await tester.tap(find.byType(TimerButton));
        await tester.pumpAndSettle();
      },
      builder: () => const TimerButton(),
    );
  });
}
