///
import 'package:counter_template/src/model.dart';

/// Note, this class extends no other class.
/// It's to be used as your app's data source, and who knows what that will be.
/// As part of the MVC design pattern, it can be anything you want.
/// The functions below are merely 'suggestions' as to the functionality
/// this class should hold. In most cases, only a Controller will call such
/// functions directly from the Model. The View and Model need not communicate.

class CounterModel {
  /// Optional but, in most cases, you need only one instance of the Model class.
  factory CounterModel() => _this ??= CounterModel._();
  CounterModel._();
  static CounterModel? _this;

  /// A getter so the count can't be changed externally.
  int get counter => _counter;
  int _counter = 0;

  /// A getter so the count can't be changed externally.
  String get data => '$_counter';

  /// The API for the interface
  void onPressed() => _counter++;
}
