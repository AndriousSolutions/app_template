import 'package:app_template/src/view.dart';

import 'package:app_template/src/app/controller/app_controller.dart' show Controller;

import 'add_contact.dart';

import 'contact_details.dart';

class ContactListState extends StateMVC<ContactsList> {
  ContactListState() : super(Controller()) {
    con = controller as Controller;
  }
  late Controller con;

  @override
  void initState() {
    super.initState();
    _title = App.title!;
  }

  String? _title;

  /// The framework calls this method whenever it removes this [State] object
  /// from the tree.
  @override
  void deactivate() {
    super.deactivate();

    /// The framework calls this method whenever it removes this [State] object
    /// from the tree. It might reinsert it into another part of the tree.
    /// Subclasses should override this method to clean up any links between
    /// this object and other elements in the tree (e.g. if you have provided an
    /// ancestor with a pointer to a descendant's [RenderObject]).
  }

  /// The framework calls this method when this [State] object will never
  /// build again.
  /// Note: THERE IS NO GUARANTEE THIS METHOD WILL RUN in the Framework.
  @override
  void dispose() {
    super.dispose();
  }

  // ignore: comment_references
  /// Override this method to respond when the [widget] changes (e.g., to start
  /// implicit animations).
  @override
  void didUpdateWidget(StatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  /// Called when a dependency of this [State] object changes.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /// Called when the system puts the app in the background or returns the app to the foreground.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    /// Passing these possible values:
    /// AppLifecycleState.paused (may enter the suspending state at any time)
    /// AppLifecycleState.resumed
    /// AppLifecycleState.inactive (may be paused at any time)
    /// AppLifecycleState.suspending (Android only)
  }

  @override
  Widget build(BuildContext context) {
    final _theme = App.themeData;
    return CupertinoPageScaffold(
//      key: con.scaffoldKey,
      child: CustomScrollView(
        semanticChildCount: 5,
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text(_title ?? widget.title),
            leading: Material(
              child: IconButton(
                icon: const Icon(Icons.sort_by_alpha),
                onPressed: () {
                  con.sort();
                },
              ),
            ),
            middle: Material(
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute<void>(
                      builder: (BuildContext _) => InheritedTheme.captureAll(
                          context, const AddContact()),
                    ),
                  );
                },
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                con.popupMenu(),
              ],
            ),
          ),
          if (con.items == null)
            const Center(
              child: CircularProgressIndicator(),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
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
                          final context = App.context!;
                          Navigator.of(context, rootNavigator: true).push(
                            CupertinoPageRoute<void>(
                              builder: (BuildContext _) =>
                                  InheritedTheme.captureAll(context,
                                      ContactDetails(contact: contact)),
                            ),
                          );
                        },
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
                              refresh();
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
    );
  }
}
