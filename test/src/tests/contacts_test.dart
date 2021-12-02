///
import '../view.dart';

//import 'package:app_template/src/home/model/contacts/contact_fields.dart';

String _location = '========================== contacts_test.dart';

/// Testing the Contacts app
Future<void> contactsTest(WidgetTester tester) async {
  // Tap the '+' icon and trigger a frame.
  await tester.tap(find.byIcon(Icons.add));

  await tester.pumpAndSettle();

  // Find a list of word pairs
  Finder finder = find.byType(TextFormField);

  // The text form fields should be available.
  expect(finder, findsWidgets, reason: _location);

  for (var cnt = 0; cnt < 7; cnt++) {
    //
    final field = finder.at(cnt);

    await tester.tap(field);
    await tester.pump();

    await tester.pumpAndSettle();
//  await tester.showKeyboard(field);
    String text = '';
    switch (cnt) {
      case 0:
        text = 'Greg';
        break;
      case 1:
        text = '';
        break;
      case 2:
        text = 'Perry';
        break;
      case 3:
        text = '647 823-3752';
        break;
      case 4:
        text = 'greg.perry@adnrioussolutions.com';
        break;
      case 5:
        text = 'Andrious Solutions Ltd.';
        break;
      case 6:
        text = 'Founder';
        break;
    }
    await tester.enterText(field, text);
  }

  finder = find.widgetWithIcon(TextButton, Icons.save);

  expect(finder, findsOneWidget, reason: _location);

  await tester.tap(finder);
  await tester.pump();

  await tester.pumpAndSettle();
  await tester.pumpAndSettle();
  await tester.pumpAndSettle();
}
