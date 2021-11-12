///
import 'package:counter_template/src/model.dart';

class CounterModel {
  /// Optional but, in most cases, you need only one instance of the Model class.
  factory CounterModel() => _this ??= CounterModel._();
  CounterModel._();
  static CounterModel? _this;

  late int _counter;

  /// Note, this class extends no other class.
  /// It's to be used as your app's data source, and who knows what that will be.
  /// As part of the MVC design pattern, it can be anything you want.
  /// The functions below are merely 'suggestions' as to the functionality
  /// this class should hold. In most cases, only a Controller will call such
  /// functions directly from the Model. The View and Model need not communicate.

  void initState() {
    _counter = Prefs.getInt('counter');
  }

  String get data => '$_counter';

  void onPressed() {
    _counter++;
    Prefs.setInt('counter', _counter);
  }

  final String whatever = 'Hello World.';

  Future<List<dynamic>> getWhatever() async {
    var contacts = <dynamic>[];
    return contacts;
  }

  Future<bool> addWhatever() async {
    var add = true;
    return add;
  }

  Future<bool> saveWhatever() async {
    var save = true;
    return save;
  }

  Future<bool> deleteWhatever() async {
    var delete = true;
    return delete;
  }
}