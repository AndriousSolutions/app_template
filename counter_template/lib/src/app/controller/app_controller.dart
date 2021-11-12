///
import 'package:counter_template/src/view.dart';

import 'package:counter_template/src/controller.dart' as c;

/// This is a 'very specialized' Controller used by effect the whole app.
/// It's usually passed to the App class' con: parameter in main.dart.tmpl.
/// In fact, it's rarely used, but for special circumstances.
/// For example, to 'switch out' the running app with another during development.
class AppController extends c.AppController {
  factory AppController() => _this ??= AppController._();
  AppController._() : super();
  static AppController? _this;

  /// Changing the properties of the App's View object detecting to
  /// use the Material Interface theme
  void onChangedMaterial({bool? material}) {
    if (material == null) {
      return;
    }
    final AppState vw = App.vw!;
    vw.switchUI = false;
    switchUI = false;
    if (material) {
      vw.useMaterial = true;
      vw.useCupertino = false;
    } else {
      vw.useMaterial = false;
      vw.useCupertino = true;
    }
    useMaterial = material;
    useCupertino = false;
  }

  /// Changing the properties of the App's View object detecting to
  /// use the Cupertino Interface theme
  void onChangediOS({bool? ios}) {
    if (ios == null) {
      return;
    }
    final AppState vw = App.vw!;
    vw.switchUI = false;
    switchUI = false;
    if (ios) {
      vw.useMaterial = false;
      vw.useCupertino = true;
    } else {
      vw.useMaterial = true;
      vw.useCupertino = false;
    }
    useCupertino = ios;
    useMaterial = false;
  }

  bool useMaterial = false;
  bool useCupertino = false;
  bool switchUI = false;

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

/// This is yet another 'special' Controller usually passed to the AppView class as
/// the parameter, con.
class CounterAppController extends c.AppController {
  factory CounterAppController() => _this ??= CounterAppController._();
  CounterAppController._() : super();
  static CounterAppController? _this;

  /// Initialize any immediate 'none time-consuming' operations at start up.
  @override
  @Deprecated('No need to replace the initState() function. Use initState()')
  void initApp() => super.initApp();

  @override
  Future<bool> initAsync() async {
    /// Initialize any 'time-consuming' operations at the beginning.
    /// Initialize items essential to the Mobile Applications.
    /// Implement any asynchronous operations needed done at start up.
    return true;
  }

  @override
  bool onAsyncError(FlutterErrorDetails details) {
    /// Supply an 'error handler' routine if something goes wrong
    /// in the corresponding initAsync() routine.
    /// Returns true if the error was properly handled.
    return false;
  }

  /// The framework will call this method exactly once.
  /// Only when the [State] object is first created.
  @override
  void initState() {
    /// Override this method to perform initialization that depends on the
    /// location at which this object was inserted into the tree.
    /// (i.e. Subscribe to another object it depends on during [initState],
    /// unsubscribe object and subscribe to a new object when it changes in
    /// [didUpdateWidget], and then unsubscribe from the object in [dispose].
    super.initState();
  }

  /// The framework calls this method whenever it removes this [State] object
  /// from the tree.
  @override
  void deactivate() {
    /// The framework calls this method whenever it removes this [State] object
    /// from the tree. It might reinsert it into another part of the tree.
    /// Subclasses should override this method to clean up any links between
    /// this object and other elements in the tree (e.g. if you have provided an
    /// ancestor with a pointer to a descendant's [RenderObject]).
    super.deactivate();
  }

  /// The framework calls this method when this [State] object will never
  /// build again.
  /// Note: THERE IS NO GUARANTEE THIS METHOD WILL RUN in the Framework.
  @override
  void dispose() {
    /// The framework calls this method when this [State] object will never
    /// build again. The [State] object's lifecycle is terminated.
    /// Subclasses should override this method to release any resources retained
    /// by this object (e.g., stop any active animations).
    /// Implement any class 'clean up' routines when shutting down.
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    /// Called when the system puts the app in the background or
    /// returns the app to the foreground.
    super.didChangeAppLifecycleState(state);
  }

  @override
  void onError(FlutterErrorDetails details) {
    /// Implement your own error routine throughout the whole app.
    super.onError(details);
  }
}
