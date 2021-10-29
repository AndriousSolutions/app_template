class Model {
  /// Optional but, in most cases, you need only one instance of the Model class.
  ///
  factory Model() => _this ??= Model._();
  Model._();
  static Model? _this;

  final String whatever = 'Hello World.';

  /// Note, this class extends no other class.
  /// It's to be used as your app's data source, and who knows what that will be.
  /// As part of the MVC architecture, it can be anything you want.
  /// The functions below are merely 'suggestions' as to the functionality
  /// this class should hold. In most cases, only a Controller will call such
  /// functions directly from the Model. The View and Model need not communicate.

  Future<bool> initAsync() async {
    bool init = true;
    return init;
  }

  void dispose() {}

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
