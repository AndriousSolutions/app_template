import 'package:mvc_application/view.dart';

import 'package:app_template/src/home/model/contacts/contact.dart' show Contact;

import 'add_contact.dart' show AddContact;

enum AppBarBehavior { normal, pinned, floating, snapping }

class ContactDetails extends StatefulWidget {
  const ContactDetails({required this.contact, Key? key}) : super(key: key);
  final Contact contact;
  @override
  State createState() => _DetailsState();
}

class _DetailsState extends State<ContactDetails> {
  @override
  void initState() {
    super.initState();
    contact = widget.contact;
  }

  late VoidCallback onTap;
  late Contact contact;

  @override
  Widget build(BuildContext context) {
    onTap = () {
      editContact(contact, context);
    };
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          previousPageTitle: 'Home',
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        middle: const Text('Sample'),
        trailing: Material(
          child: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showBox(text: 'Delete this contact?', context: context)
                  .then((bool delete) {
                if (delete) {
                  contact.delete().then((_) {
                    Navigator.of(context).maybePop();
                  });
                }
              });
            },
          ),
        ),
      ),
      child: CustomScrollView(slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            contact.givenName.onListTile(tap: onTap),
            contact.middleName.onListTile(tap: onTap),
            contact.familyName.onListTile(tap: onTap),
            contact.phone.onListItems(onTap: onTap),
            contact.email.onListItems(onTap: onTap),
            contact.company.onListTile(tap: onTap),
            contact.jobTitle.onListTile(tap: onTap),
          ]),
        ),
      ]),
    );
  }

  Future<void> editContact(Contact? contact, BuildContext context) async {
    final widget = AddContact(contact: contact, title: 'Edit a contact');
    PageRoute<void> route;
    if (App.useMaterial) {
      route =
          MaterialPageRoute<void>(builder: (BuildContext context) => widget);
    } else {
      route =
          CupertinoPageRoute<void>(builder: (BuildContext context) => widget);
    }
    await Navigator.of(context).push(route);
    setState(() {});
  }
}
