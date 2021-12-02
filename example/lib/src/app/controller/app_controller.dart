///
import 'package:mvc_application/controller.dart' as c;

import 'package:counter_template/src/view.dart';

import 'package:counter_template/src/controller.dart';

/// This is a 'very specialized' Controller used by effect the whole app.
/// It's usually passed to the App class' con: parameter in main.dart.tmpl.
/// In fact, it's rarely used, but for special circumstances.
/// For example, to 'switch out' the running app with another during development.
class AppController extends c.AppController {
  factory AppController() => _this ??= AppController._();
  AppController._() : super();
  static AppController? _this;

  /// The App's popupmenu
  Widget get popupmenu => PopupMenu().popupMenuButton;

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

  // /// Changing the properties of the App's View object detecting to
  // /// use the Material Interface theme
  // void onChangedMaterial({bool? material}) {
  //   if (material == null) {
  //     return;
  //   }
  //   final AppState vw = App.vw!;
  //   vw.switchUI = false;
  //   switchUI = false;
  //   if (material) {
  //     vw.useMaterial = true;
  //     vw.useCupertino = false;
  //   } else {
  //     vw.useMaterial = false;
  //     vw.useCupertino = true;
  //   }
  //   useMaterial = material;
  //   useCupertino = false;
  // }
  //
  // /// Changing the properties of the App's View object detecting to
  // /// use the Cupertino Interface theme
  // void onChangediOS({bool? ios}) {
  //   if (ios == null) {
  //     return;
  //   }
  //   final AppState vw = App.vw!;
  //   vw.switchUI = false;
  //   switchUI = false;
  //   if (ios) {
  //     vw.useMaterial = false;
  //     vw.useCupertino = true;
  //   } else {
  //     vw.useMaterial = true;
  //     vw.useCupertino = false;
  //   }
  //   useCupertino = ios;
  //   useMaterial = false;
  // }
  //
  // bool useMaterial = false;
  // bool useCupertino = false;
  // bool switchUI = false;

  /// Initialize any 'time-consuming' operations at the beginning.
  /// Initialize asynchronous items essential to the Mobile Applications.
  /// Typically called within a FutureBuilder() widget.
  @override
  Future<bool> initAsync() async => super.initAsync();

  /// Supply an 'error handler' routine if something goes wrong
  /// in the corresponding initAsync() routine.
  /// Returns true if the error was properly handled.
  @override
  bool onAsyncError(FlutterErrorDetails details) => super.onAsyncError(details);

  /// The framework will call this method exactly once.
  /// Only when the [StateMVC] object is first created.
  /// The framework will call this method exactly once.
  /// Only when the [StateMVC] object is first created.
  @override
  void initState() => super.initState();

  /// The framework calls this method whenever it removes this [StateMVC] object
  /// from the tree.
  @override
  void deactivate() => super.deactivate();

  /// The framework calls this method when this [StateMVC] object will never
  /// build again.
  /// Note: THERE IS NO GUARANTEE THIS METHOD WILL RUN in the Framework.
  @override
  void dispose() => super.dispose();

  // ignore: comment_references
  /// Override this method to respond when the [widget] changes (e.g., to start
  /// implicit animations).
  @override
  void didUpdateWidget(StatefulWidget oldWidget) =>
      super.didUpdateWidget(oldWidget);

  /// Called when a dependency of this [StateMVC] object changes.
  @override
  void didChangeDependencies() => super.didChangeDependencies();

  /// Called whenever the application is reassembled during debugging, for
  /// example during hot reload.
  @override
  void reassemble() => super.reassemble();

  /// This method exposes the `popRoute` notification from
  // ignore: comment_references
  /// [SystemChannels.navigation].
  @override
  Future<bool> didPopRoute() async => super.didPopRoute();

  /// This method exposes the `pushRoute` notification from
  // ignore: comment_references
  /// [SystemChannels.navigation].
  @override
  Future<bool> didPushRoute(String route) async => super.didPushRoute(route);

  /// Called when the application's dimensions change. For example,
  /// when a phone is rotated.
  @override
  void didChangeMetrics() => super.didChangeMetrics();

  /// Called when the platform's text scale factor changes.
  @override
  void didChangeTextScaleFactor() => super.didChangeTextScaleFactor();

  /// {@macro on_platform_brightness_change}
  @override
  void didChangePlatformBrightness() => super.didChangePlatformBrightness();

  /// Called when the system tells the app that the user's locale has changed.
  @override
  void didChangeLocale(Locale locale) => super.didChangeLocale(locale);

  /// Called when the system puts the app in the background or returns the app to the foreground.
  /// Passing these possible values:
  /// AppLifecycleState.paused (may enter the suspending state at any time)
  /// AppLifecycleState.resumed
  /// AppLifecycleState.inactive (may be paused at any time)
  /// AppLifecycleState.suspending (Android only)
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      super.didChangeAppLifecycleState(state);

  /// Called when the system is running low on memory.
  @override
  void didHaveMemoryPressure() => super.didHaveMemoryPressure();

  /// Called when the system changes the set of active accessibility features.
  @override
  void didChangeAccessibilityFeatures() =>
      super.didChangeAccessibilityFeatures();

  @override
  void setState(VoidCallback fn) => super.setState(fn);

  /// Allows external classes to 'refresh' or 'rebuild' the widget tree.
  @override
  void refresh() => refresh();

  /// Allow for a more accurate description
  @override
  void rebuild() => super.rebuild();

  /// For those accustom to the 'Provider' approach.
  @override
  void notifyListeners() => super.notifyListeners();
}
