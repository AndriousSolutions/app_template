///
import 'package:counter_template/src/view.dart';

import 'package:counter_template/src/controller.dart';

class CounterHome extends StatefulWidget {
  const CounterHome({Key? key, String? title})
      : _title = title ?? 'Counter Demo App',
        super(key: key);
  final String _title;
  @override
  State createState() => _CounterHomeState();
}

class _CounterHomeState extends StateMVC<CounterHome> {
  _CounterHomeState() : super(CounterController()) {
    con = controller as CounterController;
  }
  late CounterController con;

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
  Widget build(BuildContext context) =>
      App.useMaterial ? _CounterAndroid(state: this) : _CounteriOS(state: this);

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
  void onError(FlutterErrorDetails details) {
    /// Supply an 'error handler' routine to fire when an error occurs.
    /// Allows the user to define their own with each Controller.
    // details.exception, details.stack
    super.onError(details);
  }
}

/// The Android interface using the Material package
class _CounterAndroid extends StatelessWidget {
  const _CounterAndroid({Key? key, required this.state}) : super(key: key);
  final _CounterHomeState state;

  @override
  Widget build(BuildContext context) {
    final widget = state.widget;
    final con = state.con;
    return Scaffold(
      appBar: AppBar(title: Text(widget._title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Column(children: [
              Text(
                con.counter,
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(),
              Text(con.data),
            ]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('IncrementButton'),
        onPressed: () {
          // This controller calls the view to update the interface
          con.setState(con.onPressed);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// The iOS interface using the Cupertino package
class _CounteriOS extends StatelessWidget {
  const _CounteriOS({Key? key, required this.state}) : super(key: key);
  final _CounterHomeState state;

  /// The View component of this MVC design pattern!
  @override
  Widget build(BuildContext context) {
    final widget = state.widget;
    final con = state.con;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget._title),
        trailing: CupertinoButton(
          child: Icon(CupertinoIcons.add_circled),
          onPressed: () {
            con.setState(con.onPressed);
          },
          padding: EdgeInsets.zero,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text(
              con.counter,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
