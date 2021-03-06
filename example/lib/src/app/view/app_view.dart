///
import 'package:counter_template/src/view.dart';

import 'package:counter_template/src/app/controller.dart';

class CounterApp extends AppMVC {
  /// Note, all the parameters available to you are passed null
  /// just so you see that they exist.
  CounterApp()
      : super(
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
  AppState createState() => CounterAppView();
}

class CounterAppView extends AppState {
  /// All the available parameters are passed null merely to present them to you.
  /// In practice, you would not do this, but have only the parameters you would
  /// normally use with the MaterialApp widget or CupertinoApp widget.
  ///
  /// Any remaining parameters deals with the interface highlighting UI while debugging
  /// as well as error handling.
  CounterAppView()
      : super(
          key: null,
          home: const CounterHome(),
          con: AppController(),
          controllers: null,
          object: null,
          navigatorKey: null,
          routes: null,
          initialRoute: null,
          onGenerateRoute: null,
          onUnknownRoute: null,
          navigatorObservers: null,
          builder: null,
          title: 'MVC App Template',
          onGenerateTitle: null,
          theme: null,
          darkTheme: null,
          themeMode: null,
          color: null,
          locale: null,
          localizationsDelegates: null,
          localeResolutionCallback: null,
          supportedLocales: null,
          useMaterial: null, // true,
          useCupertino: null, // true,
          switchUI: Prefs.getBool('switchUI'),
          debugShowMaterialGrid: null,
          showPerformanceOverlay: null,
          checkerboardRasterCacheImages: null,
          checkerboardOffscreenLayers: null,
          showSemanticsDebugger: null,
          debugShowCheckedModeBanner: false,
          debugShowWidgetInspector: null,
          debugPaintSizeEnabled: null,
          debugPaintBaselinesEnabled: null,
          debugPaintPointersEnabled: null,
          debugPaintLayerBordersEnabled: null,
          debugRepaintRainbowEnabled: null,
          errorHandler: null,
          errorScreen: null,
          errorReport: null,
        );

  /// Clean things up when your app terminates.
  ///
  @override
  void dispose() => super.dispose();

  /// During development, if a hot reload occurs, the reassemble method is called.
  ///
  @override
  void reassemble() => super.reassemble();

  /// Default visual properties, like colors fonts and shapes, for this app's
  /// material widgets.
  ///
  /// A second [darkTheme] [ThemeData] value, which is used to provide a dark
  /// version of the user interface can also be specified. [themeMode] will
  /// control which theme will be used if a [darkTheme] is provided.
  ///
  /// The default value of this property is the value of [ThemeData.light()].
  ///
  @override
  ThemeData? onTheme() => super.onTheme();

  /// Override if you like to customize error handling.
  ///
  @override
  void onError(FlutterErrorDetails details) => super.onError(details);

  /// The application's top-level routing table.
  ///
  @override
  Map<String, WidgetBuilder>? onRoutes() => null;

  /// The name of the first route to show, if a [Navigator] is built.
  ///
  @override
  String? onInitialRoute() => null;

  /// The route generator callback used when the app is navigated to a
  /// named route.
  ///
  @override
  RouteFactory? onOnGenerateRoute() => null;

  /// Called when [onGenerateRoute] fails to generate a route, except for the
  /// [initialRoute].
  ///
  @override
  RouteFactory? onOnUnknownRoute() => null;

  /// The list of observers for the [Navigator] created for this app.
  ///
  @override
  List<NavigatorObserver>? onNavigatorObservers() => null;

  /// Material specific features such as [showDialog] and [showMenu], and widgets
  /// such as [Tooltip], [PopupMenuButton], also require a [Navigator] to properly
  /// function.
  ///
  @override
  TransitionBuilder? onBuilder() => null;

  /// A one-line description used by the device to identify the app for the user.
  ///
  @override
  String onTitle() => '';

  /// If non-null this callback function is called to produce the app's
  /// title string, otherwise [title] is used.
  ///
  @override
  GenerateAppTitle? onOnGenerateTitle(BuildContext context) => null;

  /// The primary color to use for the application in the operating system
  /// interface.
  ///
  @override
  Color? onColor() => null;

  /// The top-level [CupertinoTheme] styling.
  ///
  @override
  CupertinoThemeData? oniOSTheme() => null;

  /// The [ThemeData] to use when a 'dark mode' is requested by the system.
  ///
  @override
  ThemeData? onDarkTheme() => null;

  /// Determines which theme will be used by the application if both [theme]
  /// and [darkTheme] are provided.
  ///
  @override
  ThemeMode onThemeMode() => ThemeMode.system;

  /// The initial locale for this app's [Localizations] widget is based
  /// on this value.
  ///
  @override
  Locale? onLocale() => null;

  /// Internationalized apps that require translations for one of the locales
  /// listed in [GlobalMaterialLocalizations] should specify this parameter
  /// and list the [supportedLocales] that the application can handle.
  ///
  @override
  @mustCallSuper
  Iterable<LocalizationsDelegate<dynamic>> onLocalizationsDelegates() =>
      super.onLocalizationsDelegates();

  /// This callback is responsible for choosing the app's locale
  /// when the app is started, and when the user changes the
  /// device's locale.
  ///
  @override
  LocaleListResolutionCallback? onLocaleListResolutionCallback() => null;

  /// This callback considers only the default locale, which is the first locale
  /// in the preferred locales list. It is preferred to set [localeListResolutionCallback]
  /// over [localeResolutionCallback] as it provides the full preferred locales list.
  @override
  LocaleResolutionCallback? onLocaleResolutionCallback() => null;

  /// The list of locales that this app has been localized for.
  ///
  @override
  Iterable<Locale> onSupportedLocales() => const <Locale>[Locale('en', 'US')];

  /// Turns on a [GridPaper] overlay that paints a baseline grid
  /// Material apps.
  ///
  @override
  bool onDebugShowMaterialGrid() => false;

  /// Turns on a performance overlay.
  ///
  @override
  bool onShowPerformanceOverlay() => false;

  /// Turns on checkerboarding of raster cache images.
  ///
  @override
  bool onCheckerboardRasterCacheImages() => false;

  /// Turns on checkerboarding of layers rendered to offscreen bitmaps.
  @override
  bool onCheckerboardOffscreenLayers() => false;

  /// Turns on an overlay that shows the accessibility information
  /// reported by the framework.
  @override
  bool onShowSemanticsDebugger() => false;

  /// Turns on a little "DEBUG" banner in checked mode to indicate
  /// that the app is in checked mode. This is on by default (in
  /// checked mode), to turn it off, set the constructor argument to
  /// false. In release mode this has no effect.
  ///
  @override
  bool onDebugShowCheckedModeBanner() => true;
}
