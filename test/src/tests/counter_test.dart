///
import '../view.dart';

String _location = '========================== counter_test.dart';

/// Testing the counter app
Future<void> counterTest(WidgetTester tester) async {
  // Verify that our counter starts at 0.
  expect(find.text('0'), findsOneWidget, reason: _location);
  expect(find.text('1'), findsNothing, reason: _location);

  // 9 counts
  for (int cnt = 1; cnt <= 9; cnt++) {
    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
  }

  // Verify that our counter has incremented.
  expect(find.text('0'), findsNothing, reason: _location);
  expect(find.text('9'), findsOneWidget, reason: _location);
}
