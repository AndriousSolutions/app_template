import 'package:app_template/src/app/controller.dart' as c;

import 'package:app_template/src/controller.dart';

import 'package:app_template/src/view.dart';

/// App
class MyApp extends AppStatefulWidget {
  MyApp({Key? key}) : super(key: key);
  // This is the 'View' of the application.
  @override
  AppState createView() => MyView();
}

// This is the 'View' of the application. The 'look and feel' of the app.
class MyView extends AppState {
  MyView()
      : _con = MyController(),
        super(
          con: c.Controller(),
          inTitle: () => I10n.s('Demo App'),
          debugShowCheckedModeBanner: false,
          switchUI: Prefs.getBool('switchUI'),
          supportedLocales: I10n.supportedLocales,
          localizationsDelegates: [
            I10nDelegate(),
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
        );
  final MyController _con;

  @override
  Widget onHome() => _con.onHome();
}
