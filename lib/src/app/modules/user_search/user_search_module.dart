
import 'package:flutter_modular/flutter_modular.dart';
import 'view/user_search_screen.dart';

class UserSearchModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_,args) => const UserSearchScreen())
  ];

}