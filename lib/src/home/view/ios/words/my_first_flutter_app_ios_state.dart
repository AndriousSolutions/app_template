import 'package:app_template/src/view.dart' hide HomePage;

import 'package:app_template/src/home/view/my_first_flutter_app.dart';

import 'package:app_template/src/controller.dart';

import 'package:app_template/src/home/model/words/random_words.dart';

class RandomWordsiOS extends StateMVC<WordPairs> {
  //
  RandomWordsiOS() : super(MyController()) {
    con = controller as MyController;
  }
  late MyController con;

  @override
  void initState() {
    super.initState();
    model = widget.model;
    _title = App.title!;
  }

  // The 'data source' for the app.
  late Model model;
  String? _title;

  @override
  Widget build(BuildContext context) {
    // Register the 'controller' again and again if switched by UI.
    add(model);
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text(_title ?? widget.title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CupertinoButton(
                  key: const Key('listSaved'),
                  onPressed: _pushSaved,
                  child: const Icon(Icons.list),
                ),
                con.popupMenu(),
              ],
            ),
          ),
          SliverSafeArea(
            top: false,
            minimum: const EdgeInsets.only(top: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  if (i.isOdd) {
                    return const Divider();
                  }
                  model.build(i);
                  return CupertinoListTile(
                    title: Text(model.title),
                    trailing: model.trailing,
                    onTap: () {
                      model.onTap(i);
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      CupertinoPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<Widget> tiles = model.tiles();
          final Iterator<Widget> it = tiles.iterator;
          it.moveNext();
          return CupertinoPageScaffold(
            child: CustomScrollView(
              slivers: <Widget>[
                const CupertinoSliverNavigationBar(
                  largeTitle: Text('Saved Suggestions'),
                ),
                SliverSafeArea(
                  top: false,
                  minimum: const EdgeInsets.only(top: 8),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) {
                        final tile = it.current;
                        it.moveNext();
                        return tile;
                      },
                      childCount: tiles.length,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
