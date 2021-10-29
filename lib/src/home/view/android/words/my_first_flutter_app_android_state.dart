import 'package:app_template/src/view.dart' hide HomePage;

import 'package:app_template/src/home/view/my_first_flutter_app.dart';

import 'package:app_template/src/controller.dart';

import 'package:app_template/src/home/model/words/random_words.dart';

class RandomWordsAndroid extends StateMVC<WordPairs> {
  //
  RandomWordsAndroid() : super(MyController()) {
    con = controller as MyController;
  }
  late MyController con;

  @override
  void initState() {
    super.initState();
    model = widget.model;
    _title = App.title!;
  }

  String? _title;
  late Model model;

  @override
  Widget build(BuildContext context) {
    // registered with the State object.
    add(model);
    return Scaffold(
      appBar: AppBar(
        title: Text(_title ?? widget.title),
        actions: [
          IconButton(
            key: const Key('listSaved'),
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
          ),
          con.popupMenu(),
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, i) {
            if (i.isOdd) {
              return const Divider();
            }
            model.build(i);
            return ListTile(
              title: Text(
                model.data,
                style: const TextStyle(fontSize: 25),
              ),
              trailing: model.trailing,
              onTap: () {
                model.onTap(i);
              },
            );
          }),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = model.tiles();
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
