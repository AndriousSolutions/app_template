///
import '../view.dart';

String _location = '========================== words_test.dart';

/// Testing Random Word Pairs App
Future<void> wordsTest(WidgetTester tester) async {
  //
  Finder finder;

  if (App.useMaterial) {
    // Find a list of word pairs
    finder = find.byType(ListTile);
  } else {
    finder = find.byType(CupertinoListTile);
  }

  expect(finder, findsWidgets, reason: _location);

  if (App.useCupertino) {
    return;
  }

  // Tap the first three words
  if (App.useMaterial) {
    //
    await tester.tap(finder.first);
    await tester.pump();

    await tester.tap(finder.at(1));
    await tester.pump();

    await tester.tap(finder.at(2));
    await tester.pump();
  } else {
    //
    await tester.tapAt(tester.getTopRight(finder.first));
    await tester.pump();

    await tester.tapAt(tester.getTopRight(finder.at(1)));
    await tester.pump();

    await tester.tapAt(tester.getTopRight(finder.at(2)));
    await tester.pump();
  }

  /// Go to the 'Saved Suggestions' page
  finder = find.byKey(const Key('listSaved')); // find.bytype(IconButton);

  expect(finder, findsWidgets, reason: _location);

  await tester.tap(finder.first);
  await tester.pump();

  /// Rebuild the Widget after the state has changed
  await tester.pumpAndSettle();

//  expect(find.text('Saved Suggestions'), findsOneWidget, reason: _location);

  final model = WordPairsModel();

  /// Successfully saved the selected word-pairs.
  if (!model.saved.isNotEmpty) {
    fail('Failed to list saved suggestions');
  } else {
    expect(model.saved.length, equals(3), reason: _location);
  }

  /// Find the 'back button' and return
  await tester.tap(find.byType(IconButton).first);

  /// Wait a frame after the state has changed;
  await tester.pump();
}
