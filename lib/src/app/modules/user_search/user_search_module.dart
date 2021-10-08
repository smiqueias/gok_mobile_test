
import 'package:flutter_modular/flutter_modular.dart';
import 'screens/search_user_screen.dart';

class UserSearchModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_,args) => const UserSearchScreen())
  ];

}