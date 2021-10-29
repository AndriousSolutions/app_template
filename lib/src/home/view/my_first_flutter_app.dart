import 'package:app_template/src/home/model/words/random_words.dart';

import 'package:app_template/src/view.dart';

class WordPairs extends StatefulWidget {
  WordPairs({
    Key? key,
    this.title = 'Startup Name Generator',
  })  : model = Model(),
        super(key: key);
  final Model model;
  final String title;
  @override
  State createState() =>
      // ignore: no_logic_in_create_state
      App.useMaterial ? RandomWordsAndroid() : RandomWordsiOS();
}
