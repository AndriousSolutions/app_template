import 'package:app_template/src/controller.dart';

import 'package:app_template/src/model.dart';

// You can see 'at a glance' this Controller also 'talks to' the interface (View).
import 'package:app_template/src/view.dart';

class CounterController extends AppController {
  factory CounterController() => _this ??= CounterController._();
  CounterController._() : super() {
    //
    _model = CounterModel();

    /// Provide the 'timer' controller to the interface.
    wordPairsTimer = WordPairsController();
  }
  static CounterController? _this;

  late final CounterModel _model;

  late final WordPairsController wordPairsTimer;

  @override
  void initState() {
    super.initState();
    wordPairsTimer.addState(state);
  }

  String get data => _model.data;

  /// The 'View' is calling setState()
  void onPressed() => _model.onPressed();

  /// Retrieve the app's own controller.
  TemplateController get appController =>
      _appController ??= App.vw!.con as TemplateController;
  TemplateController? _appController;

  /// Start up the timer
  void initTimer() => wordPairsTimer.initTimer();

  /// Cancel the timer
  void cancelTimer() => wordPairsTimer.cancelTimer();

  /// Access to the timer
  WordPairsTimer get timer => wordPairsTimer.timer;

  /// Supply the word pair
  Widget get wordPair => wordPairsTimer.wordPair;

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
      TemplateController().popupMenu(
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
      );
}