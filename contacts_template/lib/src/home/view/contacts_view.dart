import 'package:contacts_template/src/view.dart';

import 'package:contacts_template/src/home/controller/contacts_controller.dart'
    show ContactsController;

import 'package:contacts_template/src/home/view/contacts/add_contact.dart';

import 'package:contacts_template/src/home/view/contacts/contact_details.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key, this.title = 'Contacts App'}) : super(key: key);
  final String title;
  @override
  State createState() => _ContactListState();
}

class _ContactListState extends StateMVC<ContactsList> {
  _ContactListState() : super(ContactsController()) {
    con = controller as ContactsController;
  }
  late ContactsController con;

  @override
  void initState() {
    super.initState();
    _title = App.title!;
  }

  String? _title;

  @override
  Widget build(BuildContext context) =>
      App.useMaterial ? _BuildAndroid(state: this) : _BuildiOS(state: this);
}

/// Android interface
class _BuildAndroid extends StatelessWidget {
  const _BuildAndroid({Key? key, required this.state}) : super(key: key);
  final _ContactListState state;

  @override
  Widget build(BuildContext context) {
    final widget = state.widget;
    final con = state.con;
    return Scaffold(
      appBar: AppBar(
        title: Text(state._title ?? widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(con.state!.context).push(MaterialPageRoute<void>(
            builder: (BuildContext _) => const AddContact(),
          ));

          /// Either use the 'then' clause or the 'async await' command.
          //     .then((_) {
          //   con.refresh();
          // });
          con.refresh();
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: con.items == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: con.items?.length ?? 0,
                itemBuilder: (_, int index) {
                  final contact = con.itemAt(index);
                  return contact!.displayName.onDismissible(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(),
                      ),
                      child: ListTile(
                        onTap: () {
                          // Don't use the builder's context. Ignore with underscore.
                          Navigator.of(con.state!.context)
                              .push(MaterialPageRoute<void>(
                            builder: (_) => ContactDetails(contact: contact),
                          ))
                              .then((_) {
                            state.setState(() {});
                          });
                        },
                        leading: contact.displayName.circleAvatar,
                        title: contact.displayName.text,
                      ),
                    ),
                    dismissed: (DismissDirection direction) {
                      con.deleteItem(index);
                      final action = (direction == DismissDirection.endToStart)
                          ? 'deleted'
                          : 'archived';
                      App.snackBar(
                        duration: const Duration(milliseconds: 8000),
                        content: Text('You $action an item.'),
                        action: SnackBarAction(
                            label: 'UNDO',
                            onPressed: () {
                              contact.undelete();
                              state.refresh();
                            }),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}

/// iOS interface
class _BuildiOS extends StatelessWidget {
  const _BuildiOS({Key? key, required this.state}) : super(key: key);
  final _ContactListState state;

  @override
  Widget build(BuildContext context) {
    final widget = state.widget;
    final con = state.con;
    final _theme = App.themeData;
    return CupertinoPageScaffold(
      child: Material(
        child: CustomScrollView(
          semanticChildCount: 5,
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text(state._title ?? widget.title),
              middle: Material(
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(con.state!.context).push(
                      CupertinoPageRoute<void>(
                        builder: (_) => const AddContact(),
                      ),
                    );
                  },
                ),
              ),
            ),
            if (con.items == null)
              const Center(
                child: CircularProgressIndicator(),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    final contact = con.itemAt(index);
                    return contact?.displayName.onDismissible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _theme?.canvasColor,
                          border: Border(
                            bottom: BorderSide(color: _theme!.dividerColor),
                          ),
                        ),
                        child: CupertinoListTile(
                          leading: contact.displayName.circleAvatar,
                          title: contact.displayName.text,
                          onTap: () {
                            Navigator.of(con.state!.context).push(
                              CupertinoPageRoute<void>(
                                builder: (BuildContext _) =>
                                    ContactDetails(contact: contact),
                              ),
                            );
                          },
                        ),
                      ),
                      dismissed: (DismissDirection direction) {
                        con.deleteItem(index);
                        final action =
                            (direction == DismissDirection.endToStart)
                                ? 'deleted'
                                : 'archived';
                        App.snackBar(
                          duration: const Duration(milliseconds: 8000),
                          content: Text('You $action an item.'),
                          action: SnackBarAction(
                              label: 'UNDO',
                              onPressed: () {
                                contact.undelete();
                                state.refresh();
                              }),
                        );
                      },
                    );
                  },
                  childCount: con.items?.length,
                  semanticIndexCallback: (Widget widget, int localIndex) {
                    if (localIndex.isEven) {
                      return localIndex ~/ 2;
                    }
                    return null;
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
