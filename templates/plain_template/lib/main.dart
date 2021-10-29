
import 'package:mvc_template/src/view.dart'
    show AppState, AppStatefulWidget, MyView, runApp;

/// We use the MVC framework's own runApp with its innate error handling.
void main() => runApp(
      MyApp(),
      errorHandler: null,
      errorScreen: null,
      errorReport: null,
    );

class MyApp extends AppStatefulWidget {
  /// Note, all the parameters available to you are passed null
  /// just so you see that they exist.
  MyApp()
      : super(
          con: null,
          key: null,
          loadingScreen: null,
          errorHandler: null,
          errorScreen: null,
          errorReport: null,
          allowNewHandlers: true,
        );

  /// Following the MVC architecture, your app begins with a View.
  /// MyView is the app's view and you go to that class to add any and all options
  /// that are to work at the 'app level.'
  /// It's also there, where you then provide the 'home' widget
  /// representing the view that's, in turn, your startup screen.
  /// Your app's not instantiated until all the Error Handling is in place.
  @override
  AppState createView() => MyView();
}
