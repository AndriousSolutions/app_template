import 'dart:async' show unawaited;

import 'package:app_template/src/controller.dart';

import 'package:app_template/src/model.dart';

// You can see 'at a glance' this Controller also 'talks to' the interface (View).
import 'package:app_template/src/view.dart';

class TemplateController extends AppController {
  factory TemplateController() => _this ??= TemplateController._();
  TemplateController._() : super();
  static TemplateController? _this;

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
  final appNames = ['Counter', 'Word Pairs', 'Contacts'];

  Widget onHome() {
    final con = state?.controllerByType<WordPairsTimer>();
    // Turn off the timer
    con?.timer.cancel();

    _appCount = Prefs.getInt('appRun');
    final Key key = UniqueKey();
    Widget? widget;
    switch (appNames[_appCount]) {
      case 'Word Pairs':
        widget = WordPairs(key: AppState.homeKey, title: App.title!);
        break;
      case 'Counter':
        widget = CounterPage(key: AppState.homeKey, title: App.title!);
        break;
      case 'Contacts':
        widget = ContactsList(key: key, title: App.title!);
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
  TemplateController get appController =>
      _appController ??= App.vw!.con as TemplateController;
  TemplateController? _appController;

  /// Supply the app's popupmenu
  Widget popupMenu({
    Key? key,
    List<String>? items,
    PopupMenuItemBuilder<String>? itemBuilder,
    String? initialValue,
    PopupMenuItemSelected<String>? onSelected,
    PopupMenuCanceled? onCanceled,
    String? tooltip,
    double? elevation,
    EdgeInsetsGeometry? padding,
    Widget? child,
    Widget? icon,
    Offset? offset,
    bool? enabled,
    ShapeBorder? shape,
    Color? color,
    bool? captureInheritedThemes,
  }) =>
      PopMenu(
        key: key,
        items: items,
        itemBuilder: itemBuilder,
        initialValue: initialValue,
        onSelected: onSelected,
        onCanceled: onCanceled,
        tooltip: tooltip,
        elevation: elevation,
        padding: padding,
        child: child,
        icon: icon,
        offset: offset,
        enabled: enabled,
        shape: shape,
        color: color,
        captureInheritedThemes: captureInheritedThemes,
      ).popupMenuButton;
}