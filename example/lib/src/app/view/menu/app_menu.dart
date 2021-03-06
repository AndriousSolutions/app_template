import 'package:counter_template/src/model.dart';

import 'package:counter_template/src/view.dart';

import 'package:counter_template/src/controller.dart';

class PopupMenu extends AppPopupMenu<String> {
  //
  PopupMenu({
    Key? key,
    List<String>? items,
    PopupMenuItemBuilder<String>? itemBuilder,
    String? initialValue,
    PopupMenuItemSelected<String>? onSelected,
    PopupMenuCanceled? onCanceled,
    String? tooltip,
    double? elevation,
    EdgeInsetsGeometry? padding,
    Widget? child,
    Widget? icon,
    Offset? offset,
    bool? enabled,
    ShapeBorder? shape,
    Color? color,
    bool? captureInheritedThemes,
  })  : _con = AppController(),
        super(
          key: key ?? const Key('appMenuButton'),
          items: items,
          itemBuilder: itemBuilder,
          initialValue: initialValue,
          onSelected: onSelected,
          onCanceled: onCanceled,
          tooltip: tooltip,
          elevation: elevation,
          padding: padding,
          child: child,
          icon: icon,
          offset: offset ?? const Offset(0, 45),
          enabled: enabled,
          shape: shape ??
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: color,
          // false so to prevent the error,
          // "Looking up a deactivated widget's ancestor is unsafe."
          captureInheritedThemes: captureInheritedThemes ?? false,
        );

  final AppController _con;

  String get interface => App.useMaterial ? 'Material' : 'Cupertino';

  @override
  List<PopupMenuItem<String>> get menuItems => [
        PopupMenuItem(
          key: const Key('interfaceMenuItem'),
          value: 'interface',
          child: Text('${I10n.s('Interface:')} $interface'),
        ),
        PopupMenuItem(
          key: const Key('aboutMenuItem'),
          value: 'about',
          child: I10n.t('About'),
        ),
      ];

  @override
  Future<void> onSelection(String value) async {
    final appContext = App.context!;
    switch (value) {
      case 'interface':
        _con.changeUI();
        break;
      case 'about':
        showAboutDialog(
          context: appContext,
          applicationName: App.vw?.title ?? '',
          applicationVersion:
              'version: ${App.version} build: ${App.buildNumber}',
        );
        break;
      default:
    }
  }
}
