///
import 'dart:ui' as ui show TextHeightBehavior;

import 'package:counter_template/src/model.dart';

import 'package:counter_template/src/view.dart';

import 'package:counter_template/src/controller.dart';

class CounterController extends ControllerMVC {
  /// Optional but a good practice to use a factory constructor for a Controller.
  factory CounterController() => _this ??= CounterController._();
  CounterController._()
      : model = CounterModel(),
        super();
  static CounterController? _this;

  /// The data source controller.
  final CounterModel model;

  /// The counter
  String get counter => model.data;

  /// The 'View' is calling setState()
  void onPressed() {
    //
    model.onPressed();

    /// Cause the framework's InheritedWidget and any of its dependencies to rebuild.
    App.vw?.inheritedNeedsBuild();
  }

  Widget text({
    Key? key,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    ui.TextHeightBehavior? textHeightBehavior,
  }) =>
      _CountText(
        key,
        this,
        style,
        strutStyle,
        textAlign,
        textDirection,
        locale,
        softWrap,
        overflow,
        textScaleFactor,
        maxLines,
        semanticsLabel,
        textWidthBasis,
        textHeightBehavior,
      );

  /// The remaining functions below are all optional.
  /// They hook into the State object associated with this Controller if any.
  /// Anything a State object can do, you can do here.
  /// Many of the function reflect the lifecycle of the State object.

  @override
  void initState() {
    /// The framework will call this method exactly once.
    /// Only when the [StateMVC] object is first created.
    super.initState();
  }

  @override
  void dispose() {
    /// The framework calls this method when this [StateMVC] object will never
    /// build again.
    super.dispose();
  }

  @override
  void deactivate() {
    /// The framework calls this method whenever it removes this [State] object
    /// from the tree.
    super.deactivate();
  }

  @override
  void didUpdateWidget(StatefulWidget oldWidget) {
    /// Called every time the StatefulWidget counterpart is re-created.
    /// The framework always calls [build] after calling [didUpdateWidget], which
    /// means any calls to [setState] in [didUpdateWidget] are redundant.
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    /// Called when the system puts the app in the background or
    /// returns the app to the foreground.
    /// Passing these possible values:
    /// AppLifecycleState.paused (may enter the suspending state at any time)
    /// AppLifecycleState.resumed
    /// AppLifecycleState.inactive (may be paused at any time)
    /// AppLifecycleState.suspending (Android only)
    super.didChangeAppLifecycleState(state);
  }

  @override
  Future<bool> didPopRoute() async {
    /// Called when the system tells the app to pop the current route.
    /// For example, on Android, this is called when the user presses
    /// the back button.
    /// Observers are notified in registration order until one returns
    /// true. If none return true, the application quits.
    return super.didPopRoute();
  }

  @override
  Future<bool> didPushRoute(String route) async {
    /// Called when the host tells the app to push a new route onto the
    /// navigator.
    /// Observers are expected to return true if they were able to
    /// handle the notification. Observers are notified in registration
    /// order until one returns true.
    ///
    /// This method exposes the `pushRoute` notification from
    return super.didPushRoute(route);
  }

  @override
  void didChangeMetrics() {
    /// Called when the application's dimensions change. For example,
    /// when a phone is rotated.
    /// In general, this is not overridden often as the layout system takes care of
    /// automatically recomputing the application geometry when the application
    /// size changes
    ///
    /// This method exposes notifications from [Window.onMetricsChanged].
    /// See sample code below. No need to call super if you override.
    ///   @override
    ///   void didChangeMetrics() {
    ///     setState(() { _lastSize = ui.window.physicalSize; });
    ///   }
    super.didChangeMetrics();
  }

  @override
  void didChangeTextScaleFactor() {
    /// Called when the platform's text scale factor changes.
    /// This typically happens as the result of the user changing system
    /// preferences, and it should affect all of the text sizes in the
    /// application.
    ///
    /// This method exposes notifications from [Window.onTextScaleFactorChanged].
    /// See sample code below. No need to call super if you override.
    ///   @override
    ///   void didChangeTextScaleFactor() {
    ///     setState(() { _lastTextScaleFactor = ui.window.textScaleFactor; });
    ///   }
    super.didChangeTextScaleFactor();
  }

  @override
  void didChangePlatformBrightness() {
    /// Called when the platform brightness changes.
    /// No 'setState()' functions are allowed to fully function at this point.
    super.didChangePlatformBrightness();
  }

  @override
  void didChangeLocale(Locale locale) {
    /// Called when the system tells the app that the user's locale has
    /// changed. For example, if the user changes the system language
    /// settings.
    /// This method exposes notifications from [Window.onLocaleChanged].
    super.didChangeLocale(locale);
  }

  @override
  void didHaveMemoryPressure() {
    /// Called when the system is running low on memory.
    /// This method exposes the `memoryPressure` notification from
    /// [SystemChannels.system].
    super.didHaveMemoryPressure();
  }

  @override
  void didChangeAccessibilityFeatures() {
    /// Called when the system changes the set of currently active accessibility
    /// features.
    /// This method exposes notifications from [Window.onAccessibilityFeaturesChanged].
    super.didChangeAccessibilityFeatures();
  }

  @override
  void didChangeDependencies() {
    /// Called when a dependency of this [State] object changes.
    /// This method is also called immediately after [initState].
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    /// During development, if a hot reload occurs, the reassemble method is called.
    /// This provides an opportunity to reinitialize any data that was prepared
    /// in the initState method.
    super.reassemble();
  }

  @override
  void setState(VoidCallback fn) {
    /// Allows 'external' routines to call this function.
    super.setState(fn);
  }

  @override
  void refresh() {
    /// Allows the user to call setState() within the Controller.
    super.refresh();
  }

  @override
  void rebuild() {
    /// This is the same at the setState() functions.
    /// Allow for a more accurate description
    super.rebuild();
  }

  @override
  void notifyListeners() {
    /// This is the same as the setState() functions.
    /// For those accustom to the 'Provider' approach.
    super.notifyListeners();
  }
}

/// A Widget that contains the enclosed controller and
/// link to the framework's InheritedWidget.
class _CountText extends StatelessWidget {
  _CountText(
    Key? key,
    this.con,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  ) : super(key: key);
  final CounterController con;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final ui.TextHeightBehavior? textHeightBehavior;

  @override
  Widget build(context) {
    /// Link to the framework's InheritedWidget
    App.vw?.inheritWidget(context);
    return Text(
      con.counter,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }
}
