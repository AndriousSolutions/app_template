/// The app's interface
import 'package:counter_template/src/view.dart';

/// We use the MVC framework's own runApp with its innate error handling.
void main() => runApp(
      CounterApp(),
      errorHandler: null,
      errorScreen: null,
      errorReport: null,
    );
