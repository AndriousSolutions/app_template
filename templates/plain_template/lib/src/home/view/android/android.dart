import 'package:mvc_template/src/view.dart';

import 'package:mvc_template/src/controller.dart';

class MyAndroid extends StateMVC<MyHome> {
  //
  MyAndroid() : super(Controller()) {
    con = controller as Controller;
  }
  late Controller con;

  @override
  Future<bool> initAsync() {
    return super.initAsync();
  }

  @override
  void initState() {
    super.initState();
  }

  /// The View component of this MVC design pattern!
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(con.data),
            ],
          ),
        ),
      );

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void didUpdateWidget(StatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
  }

  @override
  void didChangeTextScaleFactor() {
    super.didChangeTextScaleFactor();
  }

  @override
  void didChangeLocale(Locale locale) {
    super.didChangeLocale(locale);
  }

  @override
  void didHaveMemoryPressure() {
    super.didHaveMemoryPressure();
  }

  @override
  void didChangeAccessibilityFeatures() {
    super.didChangeAccessibilityFeatures();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  void setState(VoidCallback fn) {}

  @override
  void refresh() {}

  @override
  void onError(FlutterErrorDetails details) {
    super.onError(details);
  }
}
