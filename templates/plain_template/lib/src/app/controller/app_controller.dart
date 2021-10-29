import 'package:mvc_template/src/view.dart';

import 'package:mvc_template/src/controller.dart';

/// This is a 'very specialized' Controller used by effect the whole app.
/// It's usually passed to the App class' con: parameter in main.dart.tmpl.
/// In fact, it's rarely used, but for special circumstances.
/// For example, to 'switch out' the running app with another during development.
class AppCon extends AppConMVC {
  factory AppCon() => _this ??= AppCon._();
  AppCon._();
  static AppCon? _this;

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
}

/// This is yet another 'special' Controller usually passed to the AppView class as
/// the parameter, con.
class MyAppController extends AppController {
  factory MyAppController() => _this ??= MyAppController._();

  /// You can pass the State object
  MyAppController._() : super(null);
  static MyAppController? _this;

  @override
  void initApp() {
    /// Initialize any immediate 'none time-consuming' operations at start up.
  }

  /// Initialize any 'time-consuming' operations at the beginning.
  /// Initialize items essential to the Mobile Applications.
  /// Implement any asynchronous operations needed done at start up.
  ///
  @override
  Future<bool> initAsync() async {
    return super.initAsync();
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

  /// Called when the system puts the app in the background or
  /// returns the app to the foreground.
  ///
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  /// Implement your own error routine throughout the whole app.
  ///
  @override
  void onError(FlutterErrorDetails details) {
    super.onError(details);
  }
}
