import 'package:contacts_template/src/view.dart';

import 'package:contacts_template/src/controller.dart';

import 'package:contacts_template/src/home/model/contacts/contact.dart';

import 'package:contacts_template/src/home/model/contacts/contacts_db.dart';

class ContactsController extends AppController {
  //
  factory ContactsController([StateMVC? state]) =>
      _this ??= ContactsController._(state);

  ContactsController._([StateMVC? state])
      : model = ContactsDB(),
        super(state);
  final ContactsDB model;
  static ContactsController? _this;

  @override
  Future<bool> initAsync() async {
    final init = await model.initState();
    if (init) {
      await getContacts();
    }
    return init;
  }

  @override
  bool onAsyncError(FlutterErrorDetails details) {
    /// Supply an 'error handler' routine if something goes wrong
    /// in the corresponding initAsync() routine.
    /// Returns true if the error was properly handled.
    return false;
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }

  Future<List<Contact>> getContacts() async {
    return _contacts = await model.getContacts();
  }

  @override
  Future<void> refresh() async {
    await getContacts();
    super.refresh();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<Contact>? get items => _contacts;
  late List<Contact> _contacts;

  Contact? itemAt(int index) => items?.elementAt(index);

  Future<bool> deleteItem(int index) async {
    final Contact? contact = items?.elementAt(index);
    var delete = contact != null;
    if (delete) {
      delete = await contact!.delete();
    }
    await refresh();
    return delete;
  }
}
