import 'package:mvc_template/src/view.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);
  // Produces an Android Interface or an iOS interface
  @override
  // ignore: no_logic_in_create_state
  State createState() => App.useMaterial ? MyAndroid() : MyiOS();
}
