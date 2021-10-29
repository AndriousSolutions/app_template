import 'package:app_template/src/view.dart';

import 'package:app_template/src/home/model/contacts/contact.dart';

class AddContact extends StatefulWidget {
  const AddContact({this.contact, this.title, Key? key}) : super(key: key);
  final Contact? contact;
  final String? title;
  @override
  State createState() => _AddContactState();
}

class _AddContactState extends StateMVC<AddContact> {
  @override
  void initState() {
    super.initState();
    contact = widget.contact ?? Contact();
  }

  late Contact contact;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          previousPageTitle: 'Home',
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        middle: Text(widget.title ?? 'Add a contact'),
        trailing: Material(
          child: TextButton(
            onPressed: () async {
              final pop = await contact.onPressed();
              if (pop) {
                await contact.model.getContacts();
                Navigator.of(context).pop();
              }
            },
            child: const Icon(Icons.save),
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: contact.formKey,
          child: ListView(
            children: [
              contact.givenName.textFormField,
              contact.middleName.textFormField,
              contact.familyName.textFormField,
              contact.phone.onListItems(),
              contact.email.onListItems(),
              contact.company.textFormField,
              contact.jobTitle.textFormField,
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title ?? 'Add a contact'),
  //       actions: [
  //         FlatButton(
  //           onPressed: () async {
  //             final pop = await contact.onPressed();
  //             if (pop) {
  //               Navigator.of(context).pop();
  //             }
  //           },
  //           child: const Icon(Icons.save, color: Colors.white),
  //         )
  //       ],
  //     ),
  //     body: Container(
  //       padding: const EdgeInsets.all(12),
  //       child: Form(
  //         key: contact.formKey,
  //         child: ListView(
  //           children: [
  //             contact.givenName.textFormField,
  //             contact.middleName.textFormField,
  //             contact.familyName.textFormField,
  //             contact.phone.onListItems(),
  //             contact.email.onListItems(),
  //             contact.company.textFormField,
  //             contact.jobTitle.textFormField,
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
