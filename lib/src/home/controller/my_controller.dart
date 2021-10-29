///
/// Controller for the home screen.
///

// You can see 'at a glance' this Controller 'talks to' the Model.

import 'package:app_template/src/controller.dart';

import 'package:app_template/src/model.dart';

// You can see 'at a glance' this Controller also 'talks to' the interface (View).
import 'package:app_template/src/view.dart';

/// extends 'ControllerMVC' so if added to a State object
/// can 'talk to' the View. (i.e. issue a setState() function call)
class MyController extends ControllerMVC {
  factory MyController() => _this ??= MyController._();
  MyController._() {
    _model = Model();
  }
  static MyController? _this;

  late Model _model;

  String get data => _model.data;

  /// The 'View' is calling setState()
  void onPressed() => _model.onPressed();

  /// The 'Controller is calling setState()
//  void onPressed() => setState(() => _model.onPressed());

  // Assign to the 'leading' widget on the interface.
  void leading() => changeUI();

  /// Switch to the other User Interface.
  void changeUI() {
    //
    Navigator.popUntil(App.context!, ModalRoute.withName('/'));

    App.changeUI(App.useMaterial ? 'Cupertino' : 'Material');

    bool switchUI;
    if (App.useMaterial) {
      if (UniversalPlatform.isAndroid) {
        switchUI = false;
      } else {
        switchUI = true;
      }
    } else {
      if (UniversalPlatform.isAndroid) {
        switchUI = true;
      } else {
        switchUI = false;
      }
    }
    Prefs.setBool('switchUI', switchUI);
  }

  /// Indicate if the Words app is to run.
  bool get wordsApp => appNames[_appCount] == 'Word Pairs';

  /// Indicate if the Counter app is to run.
  bool get counterApp => appNames[_appCount] == 'Counter';

  /// Indicate if the Contacts app is to run.
  bool get contactsApp => appNames[_appCount] == 'Contacts';

  int _appCount = 0;
  final appNames = ['Word Pairs', 'Counter', 'Contacts'];

  Widget onHome() {
    _appCount = Prefs.getInt('appRun');
    final Key key = UniqueKey();
    Widget? widget;
    switch (appNames[_appCount]) {
      case 'Word Pairs':
        widget = WordPairs(key: AppState.homeKey);
        break;
      case 'Counter':
        widget = HomePage(key: AppState.homeKey);
        break;
      case 'Contacts':
        widget = ContactsList(key: key);
        break;
      default:
        widget = const SizedBox();
    }
    return widget;
  }

  // Supply what the interface
  String get application => appNames[_appCount];

  /// Switch to the other application.
  void changeApp([String? appName = '']) {
    if (appName == null ||
        appName.isEmpty ||
        !appNames.contains(appName.trim())) {
      //
      _appCount++;
      if (_appCount == appNames.length) {
        _appCount = 0;
      }
    } else {
      _appCount = appNames.indexOf(appName.trim());
    }

    unawaited(Prefs.setBool('words', appNames[_appCount] == 'Word'));

    unawaited(Prefs.setInt('appRun', _appCount));

    App.refresh();
  }

  /// Working with the ColorPicker to change the app's color theme
  void onColorPicker([ColorSwatch<int?>? value]) {
    App.setThemeData(value);
    App.refresh();
  }

  /// Retrieve the app's own controller.
  Controller get appController => _appController ??= App.vw!.con as Controller;
  Controller? _appController;

  /// Retrieves the app's popup menu.
  Widget popupMenu() => appController.popupMenu();
}
