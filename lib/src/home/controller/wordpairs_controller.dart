import 'package:app_template/src/controller.dart';

import 'package:app_template/src/model.dart';

// You can see 'at a glance' this Controller also 'talks to' the interface (View).
import 'package:app_template/src/view.dart';

class WordPairsController extends ControllerMVC {
  factory WordPairsController([StateMVC? state]) =>
      _this ??= WordPairsController._(state);
  WordPairsController._(StateMVC? state)
      : timer = WordPairsTimer(),
        model = WordPairsModel(),
        super(state);
  static WordPairsController? _this;
  final WordPairsTimer timer;
  final WordPairsModel model;

  @override
  void initState() {
    super.initState();
    timer.addState(state);
  }

  /// Start up the timer.
  void initTimer() => timer.initTimer();

  /// Cancel the timer
  void cancelTimer() => timer.timer.cancel();

  Widget get wordPair => timer.wordPair;

  void build(int i) => model.build(i);

  String get data => model.data;

  Widget get trailing => model.trailing;

  void onTap(int i) => model.onTap(i);

  Iterable<Widget> tiles() => model.tiles();

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
