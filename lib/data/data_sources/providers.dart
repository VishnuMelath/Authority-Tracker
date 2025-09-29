import 'package:authority_tracker/presentation/controllers/auth_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => AuthController()),
  ];
}
